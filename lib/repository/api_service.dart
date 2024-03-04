import 'package:dio/dio.dart';
import 'package:kaya/models/user_model/user_detail_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../models/authentication_model/login_model.dart';
import '../models/authentication_model/signup_model.dart';
import '../models/category_model/category_model.dart';
import '../models/image_model/slider_model.dart';
import '../models/product_detail_model/product_detail_model.dart';
import '../models/product_model/product_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://thekayalab.softbenz.com/api/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  //authentication
  @POST('auth/register')
  Future<dynamic> signup(@Body() SignUpRequestModel signupModel);

  @POST('auth/login')
  Future<LoginResponseOuterModel> login(
      @Body() LoginRequestModel loginRequestModel);

  @POST('auth/forgot-password')
  Future<dynamic> forgotPassword(
      @Body() Map<String, dynamic> forgotPasswordBody);

  @GET('auth/my-profile')
  Future<UserDetailOuterModel> getUserDetail(@Header("Authorization") String accessToken);

  //slider
  @GET('slider/for-public')
  Future<SliderModel> getSlider();

  //products
  @GET('product/latest')
  Future<ProductOuterModel> getLatestProducts(@Query("page") String page);

  @GET('product/for-public/{slug}')
  Future<ProductDetailModel> getProductDetail(@Path() String slug);

  @GET('product/search')
  Future<ProductOuterModel> getSearchProduct(
      @Query("search") String search, @Query("page") String page);

  @GET('product/by-category/{slug}')
  Future<ProductOuterModel> getProductsByCategory(@Path() String slug);

  //category
  @GET('category/top-level')
  Future<ProductCategoryOuterModel> getCategories();

  @GET('category/child-of/{slug}')
  Future<ProductCategoryOuterModel> getChildCategories(@Path() String slug);
}
