import 'package:flutter_riverpod/legacy.dart';

import '../../domain/entities/employer_ad_entity.dart';

// --- State ---
class EmployerAdState {
  final int currentStep;
  final EmployerAdData adData;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isSuccess;

  EmployerAdState({
    this.currentStep = 0,
    required this.adData,
    this.isSubmitting = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  EmployerAdState copyWith({
    int? currentStep,
    EmployerAdData? adData,
    bool? isSubmitting,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return EmployerAdState(
      currentStep: currentStep ?? this.currentStep,
      adData: adData ?? this.adData,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

// --- Provider / Notifier ---
class EmployerAdNotifier extends StateNotifier<EmployerAdState> {
  // TODO: Inject your Repository here for API calls
  // final AdRepository repository;

  EmployerAdNotifier() : super(EmployerAdState(adData: EmployerAdData()));

  void updateData(EmployerAdData newData) {
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
      // await repository.submitEmployerAd(state.adData);

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

final employerAdProvider =
    StateNotifierProvider.autoDispose<EmployerAdNotifier, EmployerAdState>((
      ref,
    ) {
      return EmployerAdNotifier();
    });
