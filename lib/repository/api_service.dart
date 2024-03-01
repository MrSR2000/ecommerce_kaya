import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/authentication_model/signup_model.dart';
import '../models/category_model/category_model.dart';
import '../models/image_model/slider_model.dart';
import '../models/product_detail_model/product_detail_model.dart';
import '../models/product_model/product_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://thekayalab.softbenz.com/api/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('slider/for-public')
  Future<SliderModel> getSlider();

  @GET('product/latest')
  Future<ProductOuterModel> getLatestProducts(@Query("page") String page);

  @GET('product/for-public/{slug}')
  Future<ProductDetailModel> getProductDetail(@Path() String slug);

  @GET('category/top-level')
  Future<ProductCategoryOuterModel> getCategories();

  @GET('category/child-of/{slug}')
  Future<ProductCategoryOuterModel> getChildCategories(@Path() String slug);

  @GET('product/search')
  Future<ProductOuterModel> getSearchProduct(
      @Query("search") String search, @Query("page") String page);

  @GET('product/by-category/{slug}')
  Future<ProductOuterModel> getProductsByCategory(@Path() String slug);

  @POST('auth/register')
  Future<dynamic> signup(@Body() SignUpRequestModel signupModel);
}
