import 'package:dio/dio.dart';

import '../../../../../core/network/api_endpoints.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/register_request_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel model);

  Future<UserModel> register(RegisterRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<LoginResponseModel> login(LoginRequestModel model) async {
    final response = await _dio.post(ApiEndpoints.login, data: model.toJson());

    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<UserModel> register(RegisterRequestModel request) async {
    final response = await _dio.post(
      ApiEndpoints.register,

      data: request.toJson(),
    );

    return UserModel.fromJson(response.data);
  }
}
