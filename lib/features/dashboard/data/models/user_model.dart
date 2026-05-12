// lib/features/dashboard/data/models/user_model.dart

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.lastName,
    required super.phone,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>;

    return UserModel(
      id: userJson['_id'],
      name: userJson['name'],
      lastName: userJson['lastName'],
      phone: userJson['phone'],
      role: _mapRole(userJson['role']),
    );
  }

  static String _mapRole(int role) {
    switch (role) {
      case 0:
        return 'کارجو';
      case 1:
        return 'کارفرما';
      case 2:
        return 'فروشنده';
      default:
        return 'ناشناخته';
    }
  }
}
