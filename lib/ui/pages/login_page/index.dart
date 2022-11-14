import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_events.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/resources/common_assets.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  late TextEditingController userNameTextController;
  late TextEditingController passWordTextController;
  late FocusNode userNameFocusNode;
  late FocusNode passWordFocusNode;
  late String userNameVal;
  late String passwordVal;
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    userNameVal = '';
    passwordVal = '';
    userNameTextController = TextEditingController(text: userNameVal);
    passWordTextController = TextEditingController(text: passwordVal);
    userNameFocusNode = FocusNode();
    passWordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => _loginBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
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
                    SizedBox(height: 40.toHeight),
                    Container(
                      height: 180.toHeight,
                      child: SvgPicture.asset(
                        CommonAssets.loginImage,
                      ),
                    ),
                    SizedBox(height: 40.toHeight),
                    Container(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25.toFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.toHeight),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                        strokeAlign: StrokeAlign.inside,
                      ))),
                      child: TextField(
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
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                          ),
                          hintText: 'Email ID',
                        ),
                      ),
                    ),
                    SizedBox(height: 40.toHeight),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                        strokeAlign: StrokeAlign.inside,
                      ))),
                      child: TextField(
                        controller: passWordTextController,
                        focusNode: passWordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
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
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 40.toHeight),
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: TextButton(
                          onPressed: () {
                            userNameFocusNode.unfocus();
                            passWordFocusNode.unfocus();
                            //call the login api here
                            _loginBloc.add(LoginButtonPressed(
                              userName: userNameVal,
                              password: passwordVal,
                            ));
                          },
                          child: Container(
                            height: 40.toHeight,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  strokeAlign: StrokeAlign.inside,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: ScreenUtil.screenWidth - 60.toWidth,
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 15.toFont,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(height: 40.toHeight),
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'New to PilogGroup? ',
                          style: TextStyle(
                            fontSize: 15.toFont,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                fontSize: 15.toFont,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
