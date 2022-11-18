import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/home/home_events.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_events.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/models/bloc_models.dart';
import 'package:inventory_manager/resources/common_assets.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class LoginPage extends StatefulWidget {
  final LoginPageBlocModel loginPageBlocModel;
  const LoginPage({
    super.key,
    required this.loginPageBlocModel,
  });

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  late HomeBloc _homeBloc;
  late TextEditingController userNameTextController;
  late TextEditingController passWordTextController;
  late FocusNode userNameFocusNode;
  late FocusNode passWordFocusNode;
  late String userNameVal;
  late String passwordVal;
  late bool hidePassword;
  @override
  void initState() {
    super.initState();
    _loginBloc = widget.loginPageBlocModel.loginBloc;
    _homeBloc = widget.loginPageBlocModel.homeBloc;
    userNameVal = '';
    passwordVal = '';
    userNameTextController = TextEditingController(text: userNameVal);
    passWordTextController = TextEditingController(text: passwordVal);
    userNameFocusNode = FocusNode();
    passWordFocusNode = FocusNode();
    hidePassword = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.kPrimaryBlueColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.toHeight,
          horizontal: 30.toWidth,
        ),
        child: BlocConsumer<LoginBloc, LoginState>(
          bloc: _loginBloc,
          listener: (context, LoginState state) {
            if (kDebugMode) {
              print('in UI listener - state : $state');
            }
            if (state is LoginSuccessState) {
              if (kDebugMode) {
                print('in UI listener succcess - state : LoginSuccessState');
              }
              //go to homePage
              navigatorKey.currentState!.pushReplacementNamed(Routes.homePath);
            } else if (state is LoginFailedState) {
              if (kDebugMode) {
                print('in UI listener failed - state : LoginFailedState');
              }
              LoginFailedState failState = state;
              //show error message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${failState.error}, Please try again'),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                // margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
              ));
            }
          },
          builder: (context, LoginState state) {
            if (state is LoginInitialState && state.isLoading == true) {
              if (kDebugMode) {
                print('in UI builder loading - state : $state');
              }
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              );
            }
            return ListView(
              children: [
                SizedBox(height: 20.toHeight),
                Container(
                  height: 280.toHeight,
                  // child: SvgPicture.asset(
                  //   CommonAssets.twoPersonGroupImage,
                  // ),
                  child: Image.asset(
                    CommonAssets.twoPersonGroupPngImage,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 30.toHeight,
                    //   child: Image.asset(CommonAssets.logoPilogPng),
                    // ),
                    SizedBox(
                      height: 10.toHeight,
                    ),
                    Text(
                      "Sign in to",
                      style: TextStyle(
                        fontFamily: CommonFonts.Poppins,
                        fontWeight: FontWeight.w700,
                        fontSize: 32.toFont,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Pilog Group",
                      style: TextStyle(
                        fontFamily: CommonFonts.Poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.toFont,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.toHeight),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffB2B6B9),
                        width: 1.0,
                        style: BorderStyle.solid,
                        strokeAlign: StrokeAlign.inside,
                      ),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14.toFont,
                      color: Colors.white,
                    ),
                    controller: userNameTextController,
                    focusNode: userNameFocusNode,
                    keyboardType: TextInputType.text,
                    onChanged: (String val) {
                      if (kDebugMode) {
                        print('username changed val : $val');
                      }
                    },
                    onSubmitted: (String val) {
                      userNameVal = val;
                    },
                    onTap: () {
                      if (userNameFocusNode.hasFocus) {
                        userNameFocusNode.unfocus();
                      } else {
                        passWordFocusNode.unfocus();
                        userNameFocusNode.requestFocus();
                      }
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                          size: 14.toFont,
                        ),
                        hintText: 'Enter email or username',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.toFont,
                        )),
                  ),
                ),
                SizedBox(height: 30.toHeight),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Color(0xffB2B6B9),
                    width: 1.0,
                    style: BorderStyle.solid,
                    strokeAlign: StrokeAlign.inside,
                  ))),
                  child: TextField(
                    style: TextStyle(fontSize: 14.toFont, color: Colors.white),
                    controller: passWordTextController,
                    focusNode: passWordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: hidePassword,
                    onTap: () {
                      if (passWordFocusNode.hasFocus) {
                        passWordFocusNode.unfocus();
                      } else {
                        userNameFocusNode.unfocus();
                        passWordFocusNode.requestFocus();
                      }
                    },
                    onChanged: (String val) {
                      if (kDebugMode) {
                        print('password changed val : $val');
                      }
                    },
                    onSubmitted: (String val) {
                      passwordVal = val;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 16.toFont,
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                          size: 14.toFont,
                        ),
                        hintText: 'Enter password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.toFont,
                        )),
                  ),
                ),
                SizedBox(height: 10.toHeight),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.toFont,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.toHeight),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: TextButton(
                    onPressed: () {
                      userNameFocusNode.unfocus();
                      passWordFocusNode.unfocus();
                      //call the login api here
                      _loginBloc.add(LoginButtonPressed(
                        userName: "AJAY_IDAM_SURVEYOR_QC",
                        password: "P@ssw0rd",
                      ));
                    },
                    child: Container(
                      height: 55.toHeight,
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
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
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
                            'Login',
                            style: TextStyle(
                              fontSize: 16.toFont,
                              fontWeight: FontWeight.w600,
                              color: CommonColors.kPrimaryBlueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10.toHeight),
                Container(
                  height: 50.toWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: CommonFonts.Poppins,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.toFont,
                        ),
                      ),
                      TextButton(
                        //
                        //
                        //Implement Register New User Logic Here
                        onPressed: () {},
                        child: Text(
                          "Register here.",
                          style: TextStyle(
                            color: const Color(0xffFF0000),
                            fontFamily: CommonFonts.Poppins,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.toFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
