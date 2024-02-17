import 'package:project/core/networking/api_error_handeler.dart';
import 'package:project/core/networking/api_reslt.dart';
import 'package:project/core/networking/api_service.dart';
import 'package:project/features/signup_screen/data/models/signup_request_body.dart';
import 'package:project/features/signup_screen/data/models/signup_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
