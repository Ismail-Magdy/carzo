import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/features/car_brand/data/models/car_brand_model.dart';
import 'package:carzo/features/car_brand/data/repos/car_brand_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'car_brand_state.dart';

class CarBrandCubit extends Cubit<CarBrandState> {
  final CarBrandRepo _carBrandRepo;
  CarBrandCubit(this._carBrandRepo) : super(CarBrandState.idle());

  void emitGetAllBrandCars(String brandName) async {
    emit(const CarBrandState.loading());
    final data = await _carBrandRepo.getCarsByBrand(brandName);

    data.when(
      success: (List<CarBrandModel> carBrand) {
        emit(CarBrandState.success(carBrand));
      },
      failure: (ApiErrorModel apiError) {
        emit(
          CarBrandState.failure(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }
}
