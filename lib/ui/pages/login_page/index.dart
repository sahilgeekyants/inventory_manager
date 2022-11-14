import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/resources/common_assets.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => _loginBloc,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.toWidth,
              horizontal: 30.toHeight,
            ),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.toHeight),
                    Container(
                      height: 180.toHeight,
                      // width: 100.toWidth,
                      child: SvgPicture.asset(
                        CommonAssets.loginImage,
                        // color: ColorsConstants.white,
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
                      child: TextField(),
                    ),
                    SizedBox(height: 40.toHeight),
                    Container(
                      child: TextButton(
                          onPressed: () {
                            //
                          },
                          child: Container(
                            height: 40.toHeight,
                            decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
                            child: Expanded(
                              child: Container(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20.toFont,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )),
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
