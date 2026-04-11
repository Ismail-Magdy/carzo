import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import '../models/all_brands_model.dart';

class AllBrandsRepo {
  final ApiServices _apiServices;
  AllBrandsRepo(this._apiServices);
  Future<ApiResult<List<AllBrandsModel>>> getAllBrands() async {
    try {
      final response = await _apiServices.getAllBrands();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
