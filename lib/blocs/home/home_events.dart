import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetUserDataEvent extends HomeEvent {
  const GetUserDataEvent();
  @override
  List<Object> get props => [];
}
