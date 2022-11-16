import 'package:equatable/equatable.dart';
import 'package:inventory_manager/serializers/product_info.dart';

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
  final List<ProductInfo> productslist;

  const GetUserDataSuccessState({required this.productslist});

  @override
  List<Object> get props => [productslist];
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
