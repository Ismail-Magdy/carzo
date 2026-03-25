import 'package:carzo/core/networking/api_constants.dart';
import 'package:carzo/features/login/data/models/login_request_model.dart';
import 'package:carzo/features/login/data/models/login_response_model.dart';
import 'package:carzo/features/recommend_for_you/data/models/all_cars_model.dart';
import 'package:carzo/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:carzo/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  /// Login User
  @POST(ApiConstants.apiLogin)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestModel);

  /// SignUp User
  @POST(ApiConstants.apiSignup)
  Future<SignUpResponseModel> signUp(
    @Body() SignUpRequestModel signUpRequestModel,
  );

  /// Get All Cars
  @GET(ApiConstants.apiAllCars)
  Future<List<AllCarsModel>> getAllCars();
}
