import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/login/data/models/login_request_model.dart';
import 'package:carzo/features/login/data/models/login_response_model.dart';

class LoginRepo {
  final ApiServices _apiServices;
  LoginRepo(this._apiServices);
  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await _apiServices.login(loginRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
