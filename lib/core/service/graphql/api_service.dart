import 'package:asroo_store/core/app/upload_image/model/upload_image_response.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/users_number_response.dart';
import 'package:asroo_store/features/auth/data/models/login_response.dart';
import 'package:asroo_store/features/auth/data/models/sign_up_response.dart';
import 'package:asroo_store/features/auth/data/models/user_role_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';
const String getUserRole = '/api/v1/auth/profile';
//https://api.escuelajs.co/api/v1/auth/profile ===> 'get' method for REST API
const String uploadImagePath = '/api/v1/files/upload';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponse> login(@Body() Map<String, dynamic> mutation);

  @GET(getUserRole)
  Future<UserRoleResponse> userRole();

  @POST(uploadImagePath)
  Future<UploadImageResponse> uploadImage(@Body() FormData file);

  @POST(graphql)
  Future<SignUpResponse> signUp(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<ProductsNumberResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<CategoriesNumberResponse> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<UsersNumberResponse> numberOfUsers(@Body() Map<String, dynamic> query);

  @POST(graphql)
  Future<GetAllCategoriesResponse> getAllCategories(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<CreateCategoryResponse> createCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphql)
  Future<void> deleteCategory(@Body() Map<String, dynamic> mutation);
}
