import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:carzo/features/sign_up/data/models/sign_up_response_model.dart';

class SignUpRepo {
  final ApiServices _apiServices;
  SignUpRepo(this._apiServices);

  Future<ApiResult<SignUpResponseModel>> signUp(
    SignUpRequestModel signUpRequestModel,
  ) async {
    try {
      final response = await _apiServices.signUp(signUpRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
