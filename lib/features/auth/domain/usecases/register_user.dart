import '../entities/register_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<UserEntity> call(RegisterEntity params) async {
    return await repository.register(params);
  }
}
