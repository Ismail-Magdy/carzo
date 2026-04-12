import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_brand_state.freezed.dart';

@freezed
abstract class CarBrandState<T> with _$CarBrandState<T> {
  const factory CarBrandState.idle() = Idle<T>;

  const factory CarBrandState.loading() = Loading<T>;
  const factory CarBrandState.success(T data) = Success<T>;
  const factory CarBrandState.failure(
    ApiNetworkExceptions apiNetworkExceptions,
  ) = Failure<T>;
}
