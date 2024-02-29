import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kaya/models/authentication_model/signup_model.dart';
import 'package:kaya/repository/api_service.dart';
import 'package:meta/meta.dart';

import '../../injection_container.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SignUpEvent>(signUpEvent);
  }

  FutureOr<void> signUpEvent(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(SignUpLoadingState());

    try {
      var response = await sl<ApiService>().signup(event.signUpRequestModel);

      log("signup success = $response");

      emit(SignUpSuccessState(signupResponse: response));
    } catch (e) {
      log("signup error = $e");

      emit(SignUpErrorState(error: e.toString()));
    }
  }
}
