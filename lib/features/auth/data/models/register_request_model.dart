import '../../domain/entities/register_entity.dart';

class RegisterRequestModel extends RegisterEntity {
  RegisterRequestModel({
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.nationalId,
    required super.birthDate,
    required super.gender,
    required super.province,
    required super.city,
    required super.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'national_id': nationalId,
      'birth_date': birthDate,
      'gender': gender,
      'province': province,
      'city': city,
      'password': password,
    };
  }
}
