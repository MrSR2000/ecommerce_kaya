import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kaya/bloc/authentication/authentication_bloc.dart';
import 'package:kaya/bloc/product/bloc/product_bloc.dart';
import 'package:kaya/bloc/product_categories/product_categories_bloc.dart';
import 'package:kaya/bloc/slider/slider_bloc.dart';
import 'package:kaya/repository/api_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  //api service
  sl.registerSingleton(ApiService(sl()));

  //Blocs
  sl.registerFactory<SliderBloc>(() => SliderBloc());
  sl.registerFactory<ProductBloc>(() => ProductBloc());
  sl.registerFactory<ProductCategoriesBloc>(() => ProductCategoriesBloc());
  sl.registerFactory<AuthenticationBloc>(() => AuthenticationBloc());
}
