import '../../domain/entities/login_entity.dart';

class LoginResponseModel extends LoginEntity {
  const LoginResponseModel({
    required super.token,
    required super.name,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
