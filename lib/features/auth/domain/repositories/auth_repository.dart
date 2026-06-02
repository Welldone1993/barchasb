import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failure.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(String phone, String password);

  Future<UserEntity> register(RegisterEntity registerData);
}
