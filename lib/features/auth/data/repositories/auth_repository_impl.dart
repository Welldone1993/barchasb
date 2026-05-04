import '../../domain/entities/login_entity.dart'; // Import LoginEntity
import '../../domain/entities/user_entity.dart'; // Import UserEntity
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart'; // Import LoginResponseModel

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  LoginEntity _toLoginEntity(LoginResponseModel model) {
    final userEntity = UserEntity(
      id: model.user.id,
      name: model.user.name,
      lastName: model.user.lastName,
      phone: model.user.phone,
      role: model.user.role,
    );

    return LoginEntity(
      message: model.message,
      user: userEntity,
      token: model.token,
    );
  }

  @override
  Future<LoginEntity> login(String phone, String password) async {
    final request = LoginRequestModel(phone: phone, password: password);
    final responseModel = await remote.login(request);
    return _toLoginEntity(responseModel);
  }
}
