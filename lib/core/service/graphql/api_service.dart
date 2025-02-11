import 'package:asroo_store/features/auth/data/models/login_response.dart';
import 'package:asroo_store/features/auth/data/models/user_role_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';
const String getUserRole = '/api/v1/auth/profile';
//https://api.escuelajs.co/api/v1/auth/profile ===> get method for REST API

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponse> login(@Body() Map<String, dynamic> mutation);

  @GET(getUserRole)
  Future<UserRoleResponse> userRole(
    @Body() Map<String, dynamic> getUserRole,
  );
}
