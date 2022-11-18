import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/home/home_states.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_events.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/models/bloc_models.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/ui/pages/home_page/components/table.dart';
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

  Map<String, Map<String, dynamic>> getAllRecords() {
    return {
      "01": {
        "Batch Id": "1",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "02": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "03": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "04": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "05": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "06": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "07": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "08": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "09": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
      "10": {
        "Batch Id": "2",
        "Entity": "2",
        "Region": [
          "Chandigarh",
          "Bangalore",
        ],
        "City Name": "Kolkata",
        "Area Name": "Bengal",
        "Area Name 2": "Bengal",
        "Area Name 3": "Bengal",
      },
    };
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _loginBloc.add(LogOutButtonPressed());
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: CommonColors.kBlackIconColor,
                                  size: 18.toHeight,
                                ),
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                  fontFamily: CommonFonts.Poppins,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.toFont,
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            //On Tap of profile Button
                            onTap: () {},
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 18.toHeight,
                                  backgroundColor: CommonColors.kTextColorLight,
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 17.toHeight,
                                      backgroundColor: CommonColors.kTextWhiteColor,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.account_circle,
                                      color: CommonColors.kTextColorLight,
                                      size: 35.5.toHeight,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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

class BottomModalWidget extends StatefulWidget {
  const BottomModalWidget({
    Key? key,
    required this.context,
    required this.properties,
    required this.checkedProperties,
  }) : super(key: key);

  final BuildContext context;
  final List<String> properties;
  final List<bool> checkedProperties;

  @override
  State<BottomModalWidget> createState() => _BottomModalWidgetState();
}

class _BottomModalWidgetState extends State<BottomModalWidget> {
  late List<String> properties;
  late List<bool> checkedProperties;
  RangeValues _currentRangeValues = const RangeValues(0, 30);
  @override
  void initState() {
    checkedProperties = widget.checkedProperties;
    properties = widget.properties;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.toHeight,
          horizontal: 20.toWidth,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.toHeight),
            topRight: Radius.circular(10.toHeight),
          ),
        ),
        height: 700.toHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    //ON tap of back button
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: CommonColors.kBlackIconColor,
                    size: 21.toHeight,
                  ),
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    fontFamily: CommonFonts.Poppins,
                    fontSize: 16.toFont,
                    color: CommonColors.kBlackIconColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                StatefulBuilder(
                  builder: ((context, setState) {
                    return GestureDetector(
                      onTap: () {
                        List<bool> newList = List.generate(
                          checkedProperties.length,
                          (index) => true,
                        );
                        setState(
                          () {
                            checkedProperties = newList;
                          },
                        );
                        print(checkedProperties);
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          fontFamily: CommonFonts.Poppins,
                          fontSize: 16.toFont,
                          color: CommonColors.kSecondaryBLueColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 20.toHeight,
            ),
            Container(
              height: 55.toHeight,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.toWidth),
                      borderSide: const BorderSide(
                        color: CommonColors.kTextFieldColor,
                      ),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: CommonColors.kTextFieldColor,
                      fontSize: 14.toFont,
                      fontFamily: CommonFonts.Poppins,
                      fontWeight: FontWeight.w300,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 30.toHeight,
                        color: CommonColors.kSearchButtonColor,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20.toHeight,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter By Category",
                  style: TextStyle(
                    fontFamily: CommonFonts.Poppins,
                    fontSize: 16.toFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5.toHeight,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.toHeight,
                  child: Wrap(
                    children: List.generate(
                      properties.length,
                      (index) {
                        return Container(
                          width: (MediaQuery.of(context).size.width / 2) - 20.toWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StatefulBuilder(
                                builder: (context, setState) {
                                  return SizedBox(
                                    height: 35.toHeight,
                                    width: 20.toWidth,
                                    child: Checkbox(
                                      side: BorderSide(
                                        width: 1.toHeight,
                                        color: CommonColors.kTextColorLight,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          4.toHeight,
                                        ),
                                      ),
                                      // activeColor:
                                      //     CommonColors.kSecondaryBLueColor,
                                      fillColor: MaterialStateProperty.all(
                                        CommonColors.kSecondaryBLueColor,
                                      ),
                                      checkColor: CommonColors.kTextWhiteColor,
                                      value: checkedProperties[index],
                                      onChanged: (value) {
                                        setState(() {
                                          checkedProperties[index] = value!;
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.toWidth,
                              ),
                              Text(
                                properties[index],
                                style: TextStyle(
                                  fontFamily: CommonFonts.Poppins,
                                  fontSize: 12.toFont,
                                  color: CommonColors.kTextColorLight,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 70.toHeight,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CommonColors.kBorderLightGrey,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(
                          color: CommonColors.kBlackIconColor,
                          fontFamily: CommonFonts.Poppins,
                          fontSize: 16.toFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 35.toHeight,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70.toHeight,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CommonColors.kBorderLightGrey,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "City",
                        style: TextStyle(
                          color: CommonColors.kBlackIconColor,
                          fontFamily: CommonFonts.Poppins,
                          fontSize: 16.toFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 35.toHeight,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90.toHeight,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CommonColors.kBorderLightGrey,
                      ),
                      bottom: BorderSide(
                        color: CommonColors.kBorderLightGrey,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Batch ID",
                            style: TextStyle(
                              color: CommonColors.kBlackIconColor,
                              fontFamily: CommonFonts.Poppins,
                              fontSize: 16.toFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "1-100",
                            style: TextStyle(
                              color: CommonColors.kSecondaryBLueColor,
                              fontFamily: CommonFonts.Poppins,
                              fontSize: 16.toFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Icon()
                        ],
                      ),
                      RangeSlider(
                        inactiveColor: CommonColors.kBlackIconColor,
                        activeColor: CommonColors.kSecondaryBLueColor,
                        values: _currentRangeValues,
                        max: 100,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, checkedProperties);
                    },
                    child: Container(
                      height: 50.toHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(55529242),
                            blurRadius: 24.toHeight,
                            offset: const Offset(
                              0,
                              14,
                            ),
                          ),
                        ],
                        color: CommonColors.kSecondaryBLueColor,
                        border: Border.all(
                          color: CommonColors.kSecondaryBLueColor,
                          width: 1.0,
                          style: BorderStyle.solid,
                          strokeAlign: StrokeAlign.inside,
                        ),
                        borderRadius: BorderRadius.circular(9.toHeight),
                      ),
                      child: Container(
                        width: ScreenUtil.screenWidth - 60.toWidth,
                        child: Center(
                          child: Text(
                            'Show',
                            style: TextStyle(
                              fontSize: 16.toFont,
                              fontFamily: CommonFonts.Poppins,
                              fontWeight: FontWeight.w500,
                              color: CommonColors.kTextWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
