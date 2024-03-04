part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  final SignUpRequestModel signUpRequestModel;

  SignUpEvent({required this.signUpRequestModel});
}

class LoginEvent extends AuthenticationEvent {
  final LoginRequestModel loginRequestModel;

  LoginEvent({required this.loginRequestModel});

}


