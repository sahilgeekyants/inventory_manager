import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String userName;
  final String password;
  const LoginButtonPressed({
    required this.userName,
    required this.password,
  });
  @override
  List<Object> get props => [userName, password];
}


// class LoginPageLoading extends LoginEvent {
//   final bool isLoading;
//   final int timestamp;

//   const LoginPageLoading({
//     required this.timestamp,
//     this.isLoading = false,
//   });

//   @override
//   List<Object> get props => [isLoading, timestamp];
// }
