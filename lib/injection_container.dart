import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kaya/bloc/authentication/authentication_bloc.dart';
import 'package:kaya/bloc/cart/cart_bloc.dart';
import 'package:kaya/bloc/product/bloc/product_bloc.dart';
import 'package:kaya/bloc/product_categories/product_categories_bloc.dart';
import 'package:kaya/bloc/slider/slider_bloc.dart';
import 'package:kaya/bloc/wishlist/wishlist_bloc.dart';
import 'package:kaya/features/products/pages/category/bloc/category_bloc.dart';
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
  sl.registerFactory<CartBloc>(() => CartBloc());
  sl.registerFactory<WishlistBloc>(() => WishlistBloc());
  sl.registerFactory<CategoryBloc>(() => CategoryBloc());

  //secure storage
  sl.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  sl.registerSingleton<GetStorage>(GetStorage());
}

//initialize bloc
CartBloc cartBloc = CartBloc();
