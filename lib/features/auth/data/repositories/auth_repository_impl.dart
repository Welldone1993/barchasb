import '../../domain/entities/login_entity.dart'; // Import LoginEntity
import '../../domain/entities/register_entity.dart';
import '../../domain/entities/user_entity.dart'; // Import UserEntity
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/register_request_model.dart';
import '../models/user_model.dart'; // Import LoginResponseModel

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

  UserEntity _toUserEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      lastName: model.lastName,
      phone: model.phone,
      role: model.role,
    );
  }

  @override
  Future<UserEntity> register(RegisterEntity registerData) async {
    final requestModel = RegisterRequestModel(
      firstName: registerData.firstName,
      lastName: registerData.lastName,
      phoneNumber: registerData.phoneNumber,
      nationalId: registerData.nationalId,
      birthDate: registerData.birthDate,
      gender: registerData.gender,
      province: registerData.province,
      city: registerData.city,
      password: registerData.password,
    );

    final responseModel = await remote.register(requestModel);
    return _toUserEntity(responseModel);
  }
}
