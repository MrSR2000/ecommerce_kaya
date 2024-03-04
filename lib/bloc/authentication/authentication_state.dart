part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

//signup
class SignUpLoadingState extends AuthenticationState {}

class SignUpSuccessState extends AuthenticationState {
  final dynamic signupResponse;

  SignUpSuccessState({required this.signupResponse});
}

class SignUpErrorState extends AuthenticationState {
  final String error;

  SignUpErrorState({required this.error});
}

//login
class LoginLoadingState extends AuthenticationState {}

class LoginSuccessState extends AuthenticationState {
  final dynamic loginResponse;

  LoginSuccessState({required this.loginResponse});
}

class LoginErrorState extends AuthenticationState {
  final String error;

  LoginErrorState({required this.error});
}
