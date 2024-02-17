import 'package:dio/dio.dart';
import 'package:project/core/networking/api_constants.dart';
import 'package:project/features/login/data/models/login_request_body.dart';
import 'package:project/features/login/data/models/login_response.dart';
import 'package:project/features/signup_screen/data/models/signup_request_body.dart';
import 'package:project/features/signup_screen/data/models/signup_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstant.register)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}
