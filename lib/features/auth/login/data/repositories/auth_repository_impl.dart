import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/login_entity.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<LoginEntity> login(String phone, String password) {
    final request = LoginRequestModel(phone: phone, password: password);
    return remote.login(request);
  }
}
