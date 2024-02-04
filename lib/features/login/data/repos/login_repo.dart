import 'package:project/core/networking/api_error_handeler.dart';
import 'package:project/core/networking/api_reslt.dart';
import 'package:project/core/networking/api_service.dart';
import 'package:project/features/login/data/models/login_reqest_body.dart';
import 'package:project/features/login/data/models/login_response.dart';

class LoginRepo
{
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody)async
  {
    try{
      final response =await _apiService.login(loginRequestBody );
     return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}