// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:inventory_manager/repository/inventory_repository.dart';
import 'package:inventory_manager/serializers/login_user.dart';
import 'package:inventory_manager/serializers/response.dart';
import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitialState(isLoading: false)) {
    on<LoginButtonPressed>(mapLogInUserToState);
    on<LogOutButtonPressed>(mapLogOutUserToState);
  }
  final InventoryRepository _repository = InventoryRepository();

  //
  Future<void> mapLogInUserToState(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginInitialState(isLoading: true));
    Response response;
    try {
      if (kDebugMode) {
        print('login function calling in bloc');
      }
      response = await _repository.userLogin(userName: event.userName, password: event.password);
      if (kDebugMode) {
        print('login function returned resoponse : ${response.body?.data ?? ''}');
        print('login function returned status : ${response.status}');
      }
      if (response.status!) {
        LoginUser loginUser = response.body!.data;
        emit(LoginSuccessState(userDetails: loginUser));
      } else {
        emit(LoginFailedState(error: response.message ?? 'Login failed'));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(LoginFailedState(error: e.toString()));
    }
  }

  Future<void> mapLogOutUserToState(
    LogOutButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LogoutInitialState(isLoading: true));
    Response response;
    try {
      if (kDebugMode) {
        print('logout function calling in bloc');
      }
      response = await _repository.userLogOut();
      if (kDebugMode) {
        print('logout function returned resoponse : ${response.body?.data ?? ''}');
        print('logout function returned status : ${response.status}');
      }
      if (response.status!) {
        emit(LogoutSuccessState());
      } else {
        emit(LogoutFailedState(error: response.message ?? 'Login failed'));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(LogoutFailedState(error: e.toString()));
    }
  }
}
