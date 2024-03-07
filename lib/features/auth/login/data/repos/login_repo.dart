import 'package:new_corse_project/core/networking/api_error_handler.dart';
import 'package:new_corse_project/core/networking/api_resuilt.dart';
import 'package:new_corse_project/core/networking/api_service.dart';
import 'package:new_corse_project/features/auth/login/data/models/login_request_body.dart';
import 'package:new_corse_project/features/auth/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResuilt<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResuilt.success(response);
    } catch (error) {
      return ApiResuilt.failure(ErrorHandler.handle(error));
    }
  }
}
