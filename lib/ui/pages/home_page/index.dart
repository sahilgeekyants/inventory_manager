import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/blocs/login/login_events.dart';
import 'package:inventory_manager/blocs/login/login_states.dart';
import 'package:inventory_manager/main.dart';
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
  String welcomeText = 'Welcome to Pilog';
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
        appBar: AppBar(
          // centerTitle: false,
          title: Container(
            // padding: EdgeInsets.only(left: 40.toWidth),
            child: Text(
              'Pilog Group',
              style: TextStyle(
                fontSize: 18.toFont,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (kDebugMode) {
                  print('Logout button pressed');
                }
                //logout here
                _loginBloc.add(LogOutButtonPressed());
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14.toFont,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
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
          child: SafeArea(
            child: Center(
              child: Text(
                welcomeText,
                style: TextStyle(
                  fontSize: 21.toFont,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: CommonFonts.Poppins,
                  // fontFamily: CommonFonts.PoppinsItalic,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
