import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/home/home_events.dart';
import 'package:inventory_manager/blocs/home/home_states.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/models/bloc_models.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/serializers/product_info.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/services/helpers/screen_functions.dart';
import 'package:inventory_manager/ui/components/circular_indicator.dart';
import 'package:inventory_manager/ui/components/show_error_snack_bar.dart';
import 'package:inventory_manager/ui/pages/home_page/components/bottom_modal_sheet/index.dart';
import 'package:inventory_manager/ui/pages/home_page/components/home_page_header/index.dart';
import 'package:inventory_manager/ui/pages/home_page/components/table/index.dart';
import 'package:inventory_manager/utils/constants/product_fields_data.dart';
import 'package:inventory_manager/utils/constants/user_roles.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class HomePage extends StatefulWidget {
  final HomePageBlocModel homePageBlocModel;
  const HomePage({
    super.key,
    required this.homePageBlocModel,
  });

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  late List<bool> checkedProperties;
  @override
  void initState() {
    super.initState();
    checkedProperties = List.generate(ProductFieldsData.allRecordLengthCount, (index) => true);
    _homeBloc = widget.homePageBlocModel.homeBloc;
    _homeBloc.add(const GetUserDataEvent());
  }

  openDrawer(BuildContext context, List<String> properties) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return BottomModalWidget(
          context: context,
          properties: properties,
          checkedProperties: checkedProperties,
        );
      },
    ).then((value) {
      if (kDebugMode) print(value);
      setState(() {
        if (value != null) {
          checkedProperties = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.toWidth),
          child: BlocConsumer<HomeBloc, HomeState>(
            bloc: _homeBloc,
            listener: (context, HomeState state) async {
              if (kDebugMode) print('in Home UI HomeBloc listener - state : $state');
              if (state is LogoutFailedState || state is GetUserDataFailedState) {
                String errMsg = (state is LogoutFailedState) ? state.error : (state as GetUserDataFailedState).error;
                showErrorSnackBar(context, errMsg);
              } else if (state is LogoutSuccessState || state is UserInfoUnavailableLoginAgainState) {
                //remove all data of user from app
                await localStorage.setIsUserLoggedIn(status: false);
                //go to loginPage
                navigatorKey.currentState!.pushReplacementNamed(Routes.loginPath);
              } else if (state is GetUserDataEmptyState) {
                String msg = state.response;
                showErrorSnackBar(context, msg);
                if (kDebugMode) print('GetUserDataEmptyState: in Home UI HomeBloc msg : $msg');
              }
            },
            builder: (context, HomeState state) {
              if (state is GetUserDataInitialState || state is LogoutInitialState) {
                if (kDebugMode) print('in Home UI builder loading - state : $state');
                return const CircularIndicator();
              } else if (state is GetUserDataFailedState ||
                  state is LogoutFailedState ||
                  state is GetUserDataEmptyState) {
                String stateResponse = (state is GetUserDataEmptyState) ? state.response : 'Something Went Wrong';
                return Center(
                    child: Text(stateResponse,
                        style: TextStyle(
                          fontSize: 16.toFont,
                          fontWeight: FontWeight.w600,
                          color: CommonColors.kPrimaryBlueColor,
                        )));
              } else if (state is GetUserDataSuccessState) {
                var productsData = state.productslist.products;
                Map<String, dynamic> infoJson;
                Map<String, Map<String, dynamic>> allRecords = {};
                int serialNumber = 1;
                String initialRecordNumber;
                List<String> properties = [];
                //added temp code to make the rows count to exact index-1
                int maxIndex = 10;
                for (var productInfo in productsData!) {
                  if (serialNumber < maxIndex) {
                    //temp condition
                    infoJson = ProductInfo().toJson(productInfo);
                    allRecords[serialNumber.toString()] = infoJson;
                    serialNumber++;
                    initialRecordNumber = allRecords.keys.toList()[0];
                    properties = allRecords[initialRecordNumber]!.keys.toList();
                  }
                }
                //
                if (allRecords.isNotEmpty && serialNumber < maxIndex) {
                  infoJson = ProductInfo().toJson(productsData[0]);
                  do {
                    allRecords[serialNumber.toString()] = infoJson;
                    serialNumber++;
                  } while (serialNumber < maxIndex);
                }
                UserRole userRole = state.userRole;
                String userLabel = (userRole == UserRole.SURVEYOR_QC) ? 'Data Surveyor QC' : 'Data Surveyor';
                return Column(
                  children: [
                    SizedBox(height: 50.toHeight, child: HomePageHeader(homeBloc: _homeBloc)),
                    Padding(
                      padding: EdgeInsets.only(left: 10.toWidth),
                      child: Column(
                        children: [
                          Container(
                            height: 50.toHeight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(userLabel,
                                    style: TextStyle(
                                      color: CommonColors.kBlackIconColor,
                                      fontFamily: CommonFonts.Poppins,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.toFont,
                                    )),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        //On Press of Search Button
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: CommonColors.kSecondaryBLueColor,
                                        size: 25.toHeight,
                                      ),
                                    ),
                                    SizedBox(width: 10.toHeight),
                                    GestureDetector(
                                      onTap: () {
                                        openDrawer(context, properties);
                                      },
                                      child: Icon(
                                        Icons.filter_list_alt,
                                        color: CommonColors.kSecondaryBLueColor,
                                        size: 25.toHeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.toHeight),
                          CustomTable(allRecords: getFilteredArray(allRecords, checkedProperties)),
                        ],
                      ),
                    )
                  ],
                );
              }
              return const CircularIndicator();
            },
          ),
        ),
      ),
    );
  }
}
