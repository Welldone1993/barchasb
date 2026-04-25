import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<LoginEntity> login(String phone, String password);
}
