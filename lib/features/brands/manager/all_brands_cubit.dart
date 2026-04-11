import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/features/brands/data/models/all_brands_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/all_brands_repo.dart';
import 'all_brands_state.dart';

class AllBrandsCubit extends Cubit<AllBrandsState> {
  final AllBrandsRepo _allBrandsRepo;
  AllBrandsCubit(this._allBrandsRepo) : super(const AllBrandsState.idle());

  void emitAllBrands() async {
    final data = await _allBrandsRepo.getAllBrands();

    data.when(
      success: (List<AllBrandsModel> allBrandsList) {
        emit(AllBrandsState.success(allBrandsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(
          AllBrandsState.failure(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }
}
