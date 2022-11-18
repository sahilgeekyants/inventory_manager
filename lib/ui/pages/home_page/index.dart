import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/home/home_states.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/models/bloc_models.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/ui/pages/home_page/components/bottom_modal_sheet/index.dart';
import 'package:inventory_manager/ui/pages/home_page/components/home_page_header/index.dart';
import 'package:inventory_manager/ui/pages/home_page/components/table/index.dart';
import 'package:inventory_manager/ui/pages/home_page/home_page_dummy_data.dart';
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
  late LoginBloc _loginBloc;
  late HomeBloc _homeBloc;
  // Map<String, Map<String, dynamic>> allRecords =
  late String initialRecordNumber;
  late List<String> properties;
  late List<bool> checkedProperties;
  @override
  void initState() {
    initialRecordNumber = getAllRecords().keys.toList()[0];
    properties = getAllRecords()[initialRecordNumber]!.keys.toList();
    checkedProperties = List.generate(properties.length, (index) {
      return true;
    });
    super.initState();
    _loginBloc = widget.homePageBlocModel.loginBloc;
    _homeBloc = widget.homePageBlocModel.homeBloc;
  }

  openDrawer(BuildContext _context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: _context,
      builder: (BuildContext _context) {
        return BottomModalWidget(
          context: context,
          properties: properties,
          checkedProperties: checkedProperties,
        );
      },
    ).then((value) {
      setState(() {
        if (value != null) {
          checkedProperties = value;
        }
      });
    });
  }

  Map<String, Map<String, dynamic>> getFilteredArray() {
    Map<String, Map<String, dynamic>> allRecords = getAllRecords();
    Map<String, Map<String, dynamic>> filteredArray = {...allRecords};
    String initialRecordNumber = allRecords.keys.toList()[0];
    List<String> properties = allRecords[initialRecordNumber]!.keys.toList();
    for (int i = 0; i < checkedProperties.length; i++) {
      if (!checkedProperties[i]) {
        for (String key in filteredArray.keys.toList()) {
          filteredArray[key]!.remove(properties[i]);
        }
      }
    }
    return filteredArray;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: (context, LoginState state) async {
        if (kDebugMode) {
          print('in HOme UI LoginBloc listener - state : $state');
        }
        if (state is LogoutSuccessState) {
          if (kDebugMode) {
            print('in UI listener succcess - state : LogoutSuccessState');
          }
          //remove all data of user from app
          await localStorage.setIsWalkThroughComplete(status: false);
          //go to loginPage
          navigatorKey.currentState!.pushReplacementNamed(Routes.loginPath);
        } else if (state is LogoutFailedState) {
          if (kDebugMode) {
            print('in UI listener failed - state : LogoutFailedState');
          }
          LogoutFailedState failState = state;
          //show error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${failState.error}, Please try again'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ));
        }
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, HomeState state) {
          if (kDebugMode) {
            print('in Home UI HomeBloc listener - state : $state');
          }
        },
        builder: (context, HomeState state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.toWidth,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.toHeight,
                      child: HomePageHeader(loginBloc: _loginBloc),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.toWidth,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 50.toHeight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Data Surveyor",
                                  style: TextStyle(
                                    color: CommonColors.kBlackIconColor,
                                    fontFamily: CommonFonts.Poppins,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.toFont,
                                  ),
                                ),
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
                                    SizedBox(
                                      width: 10.toHeight,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        openDrawer(context);
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
                          SizedBox(
                            height: 10.toHeight,
                          ),
                          CustomTable(
                            allRecords: getFilteredArray(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
