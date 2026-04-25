import 'package:dio/dio.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel model);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(LoginRequestModel model) async {
    try {
      final response = await dio.post(
        '/api/login', // فقط path بده چون baseUrl از dioProvider میاد
        data: model.toJson(),
      );

      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Login failed');
    }
  }
}
