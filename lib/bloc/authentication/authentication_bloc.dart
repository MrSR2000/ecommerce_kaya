import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kaya/models/authentication_model/signup_model.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

import '../../core/resources/functions/dio_error.dart';
import '../../injection_container.dart';
import '../../models/authentication_model/login_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SignUpEvent>(signUpEvent);
    on<LoginEvent>(loginEvent);
  }

  FutureOr<void> signUpEvent(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(SignUpLoadingState());

    try {
      var response = await sl<ApiService>().signup(event.signUpRequestModel);

      log("signup success = $response");

      emit(SignUpSuccessState(signupResponse: response));
    } catch (e) {
      var error = dioErrorResponse(e);

      log("signup error = $error");

      emit(SignUpErrorState(error: error));
    }
  }

  FutureOr<void> loginEvent(
      LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoginLoadingState());

    try {
      var response = await sl<ApiService>().login(event.loginRequestModel);

      log("login success = $response");

      emit(LoginSuccessState(loginResponse: response));
    } catch (e) {
      var error = dioErrorResponse(e);

      log("login error = $error");

      emit(LoginErrorState(error: error));
    }
  }
}
