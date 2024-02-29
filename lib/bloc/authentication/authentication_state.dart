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
