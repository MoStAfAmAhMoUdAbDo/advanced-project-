import 'package:new_corse_project/core/networking/api_error_handler.dart';
import 'package:new_corse_project/core/networking/api_resuilt.dart';
import 'package:new_corse_project/core/networking/api_service.dart';
import 'package:new_corse_project/features/auth/signup/data/models/sign_up_request_body.dart';
import 'package:new_corse_project/features/auth/signup/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);
  Future<ApiResuilt<SignUpResponse>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResuilt.success(response);
    } catch (error) {
      return ApiResuilt.failure(ErrorHandler.handle(error));
    }
  }
}
