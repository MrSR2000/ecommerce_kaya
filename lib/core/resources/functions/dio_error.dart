import 'dart:developer';

import 'package:dio/dio.dart';

dioErrorResponse(dynamic e) {
  DioException error = e as DioException;

  log("error = ${error.response!.data}");

  return error.response!.data['message'];
}
