import 'package:equatable/equatable.dart';
import 'package:inventory_manager/serializers/login_user.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitialState extends LoginState {
  final bool isLoading;

  const LoginInitialState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LoginSuccessState extends LoginState {
  final LoginUser userDetails;

  const LoginSuccessState({required this.userDetails});

  @override
  List<Object> get props => [userDetails];
}

class LoginFailedState extends LoginState {
  final String error;

  const LoginFailedState({required this.error});

  @override
  List<Object> get props => [error];
}

//

class LogoutInitialState extends LoginState {
  final bool isLoading;

  const LogoutInitialState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LogoutSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LogoutFailedState extends LoginState {
  final String error;

  const LogoutFailedState({required this.error});

  @override
  List<Object> get props => [error];
}
