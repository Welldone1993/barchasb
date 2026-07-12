import '../../domain/entities/digital_ad_entity.dart';

class DigitalAdDataModel extends DigitalAdDataEntity {
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'title': title,
      'description': description,
      'digitalTotalDesc': digitalTotalDesc,
      'projectNames': projectNames,
      'projectDescriptions': projectDescriptions,
      'minBudget': minBudget,
      'maxBudget': maxBudget,
      'person': person,
      'remote': remote,
      'thursdayHalf': thursdayHalf,
      'paymentMethod': paymentMethod,
      'verifyCode': verifyCode,
      'adStatus': adStatus,
      'requestType': requestType,
      'durationUnit': durationUnit,
      'durationAmount': durationAmount,
      'approvedAt': approvedAt?.toIso8601String(),
      'expiresAt': expiresAt?.toIso8601String(),
    };
  }
}
