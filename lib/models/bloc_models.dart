import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';

class LoginPageBlocModel {
  final LoginBloc loginBloc;
  final HomeBloc homeBloc;

  LoginPageBlocModel(
    this.loginBloc,
    this.homeBloc,
  );
}

class HomePageBlocModel {
  final LoginBloc loginBloc;
  final HomeBloc homeBloc;

  HomePageBlocModel(
    this.loginBloc,
    this.homeBloc,
  );
}

class AllBlocModel {
  final LoginBloc loginBloc;
  final HomeBloc homeBloc;

  AllBlocModel(
    this.loginBloc,
    this.homeBloc,
  );
}
