import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';

import '../models/car_brand_model.dart';

class CarBrandRepo {
  final ApiServices _apiServices;

  CarBrandRepo(this._apiServices);

  Future<ApiResult<List<CarBrandModel>>> getCarsByBrand(
    String brandName,
  ) async {
    try {
      final response = await _apiServices.getCarsByBrand(brandName);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
