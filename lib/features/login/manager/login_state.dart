import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:carzo/core/networking/api_network_exceptions.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState<T> with _$LoginState<T> {
  const factory LoginState.idle() = Idle<T>;

  const factory LoginState.loading() = Loading<T>;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.failure(ApiNetworkExceptions apiError) = Failure<T>;
}
