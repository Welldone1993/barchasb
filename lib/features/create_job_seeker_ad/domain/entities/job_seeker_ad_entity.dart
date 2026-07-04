// --- Entity / Model ---
class JobSeekerAdData {
  // Step 1
  final String? profileImagePath; // TODO: Handle image picking
  final String name;
  final String title;
  final String? jobCategory; // TODO: Fetch categories from API
  final String description;

  // Step 2
  final String? cooperationType;
  final String? gender;
  final String? experience;
  final String? paymentType;
  final String? minSalary;
  final String? maxSalary;
  final String? startTime;
  final String? endTime;
  final String? militaryService;
  final String? otherFeatures;

  // Step 3
  final String? selectedPaymentMethod; // subscription, wallet, bank

  // Step 4
  final String smsCode;
  final bool isChatEnabled;
  final bool isCallEnabled;

  JobSeekerAdData({
    this.profileImagePath,
    this.name = '',
    this.title = '',
    this.jobCategory,
    this.description = '',
    this.cooperationType,
    this.gender,
    this.experience,
    this.paymentType,
    this.minSalary,
    this.maxSalary,
    this.startTime,
    this.endTime,
    this.militaryService,
    this.otherFeatures,
    this.selectedPaymentMethod,
    this.smsCode = '',
    this.isChatEnabled = false,
    this.isCallEnabled = false,
  });

  JobSeekerAdData copyWith({
    String? profileImagePath,
    String? name,
    String? title,
    String? jobCategory,
    String? description,
    String? cooperationType,
    String? gender,
    String? experience,
    String? paymentType,
    String? minSalary,
    String? maxSalary,
    String? startTime,
    String? endTime,
    String? militaryService,
    String? otherFeatures,
    String? selectedPaymentMethod,
    String? smsCode,
    bool? isChatEnabled,
    bool? isCallEnabled,
  }) {
    return JobSeekerAdData(
      profileImagePath: profileImagePath ?? this.profileImagePath,
      name: name ?? this.name,
      title: title ?? this.title,
      jobCategory: jobCategory ?? this.jobCategory,
      description: description ?? this.description,
      cooperationType: cooperationType ?? this.cooperationType,
      gender: gender ?? this.gender,
      experience: experience ?? this.experience,
      paymentType: paymentType ?? this.paymentType,
      minSalary: minSalary ?? this.minSalary,
      maxSalary: maxSalary ?? this.maxSalary,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      militaryService: militaryService ?? this.militaryService,
      otherFeatures: otherFeatures ?? this.otherFeatures,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      smsCode: smsCode ?? this.smsCode,
      isChatEnabled: isChatEnabled ?? this.isChatEnabled,
      isCallEnabled: isCallEnabled ?? this.isCallEnabled,
    );
  }
}
