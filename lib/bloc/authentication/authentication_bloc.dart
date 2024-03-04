import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kaya/core/constants/constants.dart';
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
    on<ForgotPasswordEvent>(forgotPasswordEvent);
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

      //store keys in secure storage
      sl<FlutterSecureStorage>()
          .write(key: accessTokenKey, value: response.data.accessToken);
      sl<FlutterSecureStorage>()
          .write(key: refreshTokenKey, value: response.data.refreshToken);

      //get storage
      sl<GetStorage>().write(emailKey, response.data.email);
      sl<GetStorage>().write(fullNameKey, response.data.fullName);
      sl<GetStorage>().write(isEmailVerifiedKey, response.data.fullName);
      sl<GetStorage>().write(fullNameKey, response.data.fullName);

      emit(LoginSuccessState(loginResponse: response));
    } catch (e) {
      var error = dioErrorResponse(e);

      log("login error = $error");

      emit(LoginErrorState(error: error));
    }
  }

  FutureOr<void> forgotPasswordEvent(
      ForgotPasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(ForgotPasswordLoadingState());

    try {
      Map<String, dynamic> forgotPasswordBody = {
        "emailOrContactNumber": event.email
      };

      var response = await sl<ApiService>().forgotPassword(forgotPasswordBody);

      log("forgot password success = $response");

      emit(ForgotPasswordSuccessState(forgotPasswordResponse: response));
    } catch (e) {
      var error = dioErrorResponse(e);

      log("forgot pw error = $error");

      emit(ForgotPasswordErrorState(error: error));
    }
  }
}
