import 'package:equatable/equatable.dart';
import 'package:inventory_manager/serializers/products_list.dart';
import 'package:inventory_manager/utils/constants/user_roles.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  final bool isLoading;

  const HomeInitialState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class GetUserDataInitialState extends HomeState {
  final bool isLoading;

  const GetUserDataInitialState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class GetUserDataSuccessState extends HomeState {
  final ProductsList productslist;
  final UserRole userRole;

  const GetUserDataSuccessState({required this.productslist, required this.userRole});

  @override
  List<Object> get props => [productslist, userRole];
}

class GetUserDataEmptyState extends HomeState {
  final String response;

  const GetUserDataEmptyState({required this.response});

  @override
  List<Object> get props => [response];
}

class GetUserDataFailedState extends HomeState {
  final String error;

  const GetUserDataFailedState({required this.error});

  @override
  List<Object> get props => [error];
}

class UserInfoUnavailableLoginAgainState extends HomeState {
  final String error;

  const UserInfoUnavailableLoginAgainState({required this.error});

  @override
  List<Object> get props => [error];
}

//
class LogoutInitialState extends HomeState {
  final bool isLoading;

  const LogoutInitialState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LogoutSuccessState extends HomeState {
  @override
  List<Object> get props => [];
}

class LogoutFailedState extends HomeState {
  final String error;

  const LogoutFailedState({required this.error});

  @override
  List<Object> get props => [error];
}
