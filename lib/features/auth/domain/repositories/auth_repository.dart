import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<LoginEntity> login(String phone, String password);

  Future<UserEntity> register(RegisterEntity registerData);
}
