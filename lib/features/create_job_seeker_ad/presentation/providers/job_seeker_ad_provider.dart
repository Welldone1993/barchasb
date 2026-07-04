import 'package:flutter_riverpod/legacy.dart';

 import '../../domain/entities/job_seeker_ad_entity.dart';

// --- State ---
class JobSeekerAdState {
  final int currentStep;
  final JobSeekerAdData adData;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isSuccess;

  JobSeekerAdState({
    this.currentStep = 0,
    required this.adData,
    this.isSubmitting = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  JobSeekerAdState copyWith({
    int? currentStep,
    JobSeekerAdData? adData,
    bool? isSubmitting,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return JobSeekerAdState(
      currentStep: currentStep ?? this.currentStep,
      adData: adData ?? this.adData,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

// --- Provider / Notifier ---
class JobSeekerAdNotifier extends StateNotifier<JobSeekerAdState> {
  // TODO: Inject your Repository here for API calls
  // final AdRepository repository;

  JobSeekerAdNotifier() : super(JobSeekerAdState(adData: JobSeekerAdData()));

  void updateData(JobSeekerAdData newData) {
    state = state.copyWith(adData: newData);
  }

  void nextStep() {
    if (state.currentStep < 4) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void prevStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  Future<void> submitAd() async {
    // رفتن به مرحله ۵ (در انتظار تایید)
    state = state.copyWith(
      currentStep: 4,
      isSubmitting: true,
      errorMessage: null,
    );

    try {
      // TODO: Call your repository here passing state.adData
      // await repository.submitJobSeekerAd(state.adData);

      // شبیه‌سازی درخواست API
      await Future.delayed(const Duration(seconds: 3));

      state = state.copyWith(isSubmitting: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'خطا در ثبت آگهی. لطفا دوباره تلاش کنید.',
        currentStep: 3, // در صورت خطا برگردد به مرحله قبل
      );
    }
  }
}

final jobSeekerAdProvider =
    StateNotifierProvider.autoDispose<JobSeekerAdNotifier, JobSeekerAdState>((
      ref,
    ) {
      return JobSeekerAdNotifier();
    });
