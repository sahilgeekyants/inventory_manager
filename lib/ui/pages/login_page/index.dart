import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_events.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/main.dart';
import 'package:inventory_manager/models/bloc_models.dart';
import 'package:inventory_manager/resources/common_assets.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/routes/route_util.dart';
import 'package:inventory_manager/ui/components/circular_indicator.dart';
import 'package:inventory_manager/ui/components/show_error_snack_bar.dart';
import 'package:inventory_manager/utils/constants/strings.dart';
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
        padding: EdgeInsets.symmetric(vertical: 20.toHeight, horizontal: 30.toWidth),
        child: BlocConsumer<LoginBloc, LoginState>(
          bloc: _loginBloc,
          listener: (context, LoginState state) {
            if (state is LoginSuccessState) {
              //go to homePage
              navigatorKey.currentState!.pushReplacementNamed(Routes.homePath);
            } else if (state is LoginFailedState) {
              LoginFailedState failState = state;
              //show error message
              showErrorSnackBar(context, '${failState.error}, ${AppStrings.tryAgain}');
            }
          },
          builder: (context, LoginState state) {
            if (state is LoginInitialState && state.isLoading == true) {
              return const CircularIndicator();
            }
            return ListView(
              children: [
                SizedBox(height: 20.toHeight),
                Container(
                  height: 280.toHeight,
                  child: Image.asset(CommonAssets.twoPersonGroupPngImage),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.toHeight),
                    Text(
                      AppStrings.signInTo,
                      style: TextStyle(
                        fontFamily: CommonFonts.Poppins,
                        fontWeight: FontWeight.w700,
                        fontSize: 32.toFont,
                        color: CommonColors.kTextWhiteColor,
                      ),
                    ),
                    Text(
                      AppStrings.pilogGroup,
                      style: TextStyle(
                        fontFamily: CommonFonts.Poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.toFont,
                        color: CommonColors.kTextWhiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.toHeight),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CommonColors.kTextFieldBorderColor,
                        width: 1.0,
                        style: BorderStyle.solid,
                        strokeAlign: StrokeAlign.inside,
                      ),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14.toFont,
                      color: CommonColors.kTextWhiteColor,
                    ),
                    controller: userNameTextController,
                    focusNode: userNameFocusNode,
                    keyboardType: TextInputType.text,
                    onChanged: (String val) {
                      userNameVal = val;
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
                        color: CommonColors.kTextWhiteColor,
                        size: 14.toFont,
                      ),
                      hintText: AppStrings.usernameHintText,
                      hintStyle: TextStyle(
                        color: CommonColors.kTextWhiteColor,
                        fontSize: 14.toFont,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.toHeight),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: CommonColors.kTextFieldBorderColor,
                    width: 1.0,
                    style: BorderStyle.solid,
                    strokeAlign: StrokeAlign.inside,
                  ))),
                  child: TextField(
                    style: TextStyle(fontSize: 14.toFont, color: CommonColors.kTextWhiteColor),
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
                      passwordVal = val;
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
                            hidePassword ? Icons.visibility_off : Icons.visibility,
                            size: 16.toFont,
                            color: CommonColors.kTextWhiteColor,
                          ),
                        ),
                        icon: Icon(
                          Icons.lock_outline,
                          color: CommonColors.kTextWhiteColor,
                          size: 14.toFont,
                        ),
                        hintText: AppStrings.passwordHintText,
                        hintStyle: TextStyle(
                          color: CommonColors.kTextWhiteColor,
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
                        AppStrings.forgotPassword,
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
                        userName: userNameVal,
                        password: passwordVal,
                      ));
                    },
                    child: Container(
                      height: 55.toHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CommonColors.kLoginButtonShadowColor,
                            blurRadius: 24.toHeight,
                            offset: const Offset(
                              0,
                              14,
                            ),
                          ),
                        ],
                        color: CommonColors.kTextWhiteColor,
                        border: Border.all(
                          color: CommonColors.kTextWhiteColor,
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
                            AppStrings.login,
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
                Container(
                  height: 50.toWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAnAcc,
                        style: TextStyle(
                          color: CommonColors.kTextWhiteColor,
                          fontFamily: CommonFonts.Poppins,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.toFont,
                        ),
                      ),
                      TextButton(
                        //Implement Register New User Logic Here
                        onPressed: () {},
                        child: Text(
                          AppStrings.registerHere,
                          style: TextStyle(
                            color: CommonColors.kRegisterButtonRedColor,
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
