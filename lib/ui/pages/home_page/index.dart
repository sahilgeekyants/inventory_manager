import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_events.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List recordInfoItems = [
    "Batch Id",
    "Entity",
    "Region",
    "City Name",
    "Area Name",
    "Area Name",
    "Area Name",
  ];
  String welcomeText = 'Welcome to Pilog';
  late LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  List<Widget> _buildCells(int count) {
    return List.generate(count, (index) {
      return Container(
        alignment: Alignment.center,
        width: 120.toWidth,
        height: 60.toHeight,
        color: Colors.white,
        child: Text(
          "${index + 1}",
          style: const TextStyle(
            fontFamily: CommonFonts.Poppins,
            color: CommonColors.kTextColorLight,
          ),
        ),
      );
    });
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: [..._buildCells(recordInfoItems.length)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => _loginBloc,
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<LoginBloc, LoginState>(
            listener: (context, LoginState state) async {
              if (kDebugMode) {
                print('in UI listener - state : $state');
              }
              if (state is LogoutSuccessState) {
                if (kDebugMode) {
                  print('in UI listener succcess - state : LogoutSuccessState');
                }
                //remove all data of user from app
                await localStorage.setIsWalkThroughComplete(status: false);
                //go to loginPage
                navigatorKey.currentState!
                    .pushReplacementNamed(Routes.loginPath);
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
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 60.toHeight,
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
                                color: Colors.black,
                                size: 25.toFont,
                              ),
                            ),
                            Text(
                              "Back",
                              style: TextStyle(
                                fontFamily: CommonFonts.Poppins,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.toFont,
                              ),
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.account_circle,
                            size: 30.toFont,
                            color: const Color(0xff7D7D7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.toWidth,
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
                                  color: Colors.black,
                                  fontFamily: CommonFonts.Poppins,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.toFont,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    //On Pressing Search Button
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.search,
                                      color: const Color(0xff0080F6),
                                      size: 25.toFont,
                                    ),
                                  ),
                                  IconButton(
                                    //On Pressing Filter button
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.filter_list_alt,
                                      color: const Color(0xff0080F6),
                                      size: 25.toFont,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: 20.toWidth,
                          ),
                          height: 575.toHeight,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  child: Stack(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 120.toWidth,
                                                height: 60.toHeight,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          "Record No",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                CommonFonts
                                                                    .Poppins,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1.toWidth,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ..._buildCells(
                                                20,
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: List.generate(
                                                      recordInfoItems.length,
                                                      (index) {
                                                        return Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 120.toWidth,
                                                          height: 60.toHeight,
                                                          color: Colors.blue,
                                                          child: Text(
                                                            "${recordInfoItems[index]}",
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  CommonFonts
                                                                      .Poppins,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  ..._buildRows(
                                                    20,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                        child: Container(
                                          width: 120.toWidth,
                                          height: 1260.toHeight,
                                          decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x20000000),
                                                blurStyle: BlurStyle.outer,
                                                blurRadius: 20,
                                                spreadRadius: 1,
                                                offset: Offset(
                                                  0,
                                                  0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
