class DigitalAdDataEntity {
  final String? owner;
  final String? title;
  final String? description;
  final String? digitalTotalDesc;
  final List<String>? projectNames;
  final List<String>? projectDescriptions;
  final String? minBudget;
  final String? maxBudget;
  final String? person; // self | other
  final bool? remote;
  final bool? thursdayHalf;
  final String? paymentMethod; // Subscription | Wallet | Bank_card
  final String? verifyCode;
  final String? adStatus;
  final String? requestType;
  final String? durationUnit;
  final int? durationAmount;
  final DateTime? approvedAt;
  final DateTime? expiresAt;
  final List<dynamic>? images;

  const DigitalAdDataEntity({
    this.owner,
    this.title,
    this.description,
    this.digitalTotalDesc,
    this.projectNames,
    this.projectDescriptions,
    this.minBudget,
    this.maxBudget,
    this.person,
    this.remote,
    this.thursdayHalf,
    this.paymentMethod,
    this.verifyCode,
    this.adStatus,
    this.requestType,
    this.durationUnit,
    this.durationAmount,
    this.approvedAt,
    this.expiresAt,
    this.images,
  });
}
