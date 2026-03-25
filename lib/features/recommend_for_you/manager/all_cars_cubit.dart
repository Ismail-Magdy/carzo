import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/features/recommend_for_you/data/models/all_cars_model.dart';
import 'package:carzo/features/recommend_for_you/data/repos/all_cars_repo.dart';
import 'package:carzo/features/recommend_for_you/manager/all_cars_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCarsCubit extends Cubit<AllCarsState> {
  final AllCarsRepo allCarsRepo;
  AllCarsCubit(this.allCarsRepo) : super(const AllCarsState.idle());

  void emitAllCars() async {
    var data = await allCarsRepo.getAllCars();
    data.when(
      success: (List<AllCarsModel> allCarsList) {
        emit(AllCarsState.success(allCarsList));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          AllCarsState.failure(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }
}
