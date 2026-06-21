import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/employer_ad_provider.dart';
import '../widgets/step_1.dart';
import '../widgets/step_2.dart';
import '../widgets/step_3.dart';
import '../widgets/step_4.dart';
import '../widgets/step_5.dart';

class EmployerAddJobScreen extends ConsumerStatefulWidget {
  const EmployerAddJobScreen({super.key});

  @override
  ConsumerState<EmployerAddJobScreen> createState() =>
      _EmployerAddJobScreenState();
}

class _EmployerAddJobScreenState extends ConsumerState<EmployerAddJobScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(employerAdProvider);

    // گوش دادن به تغییرات استپ برای انیمیشن PageView
    ref.listen<EmployerAdState>(employerAdProvider, (previous, next) {
      if (previous?.currentStep != next.currentStep) {
        _pageController.animateToPage(
          next.currentStep,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // رنگ پس زمینه روشن
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // هدر استپر (سفارشی و غیرقابل کلیک)
              _buildStepperHeader(state.currentStep),
              const SizedBox(height: 24),

              // محتوای مراحل
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  // جلوگیری از سوایپ دستی
                  children: [
                    Step1BasicInfo(ref: ref, state: state),
                    Step2Details(ref: ref, state: state),
                    Step3Payment(ref: ref, state: state),
                    Step4Verification(ref: ref, state: state),
                    Step5FinalStatus(state: state),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- استپر سفارشی بالای صفحه ---
  Widget _buildStepperHeader(int currentStep) {
    List<Widget> stepperWidgets = [];
    for (int i = 0; i < 5; i++) {
      bool isPassedOrCurrent = i <= currentStep;

      // دایره استپ
      stepperWidgets.add(
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPassedOrCurrent ? const Color(0xFF2C4B6B) : Colors.white,
            border: Border.all(color: const Color(0xFF2C4B6B), width: 1.5),
          ),
        ),
      );

      // خط رابط (به جز آیتم آخر)
      if (i < 4) {
        stepperWidgets.add(
          Expanded(
            child: Container(
              height: 2,
              color: isPassedOrCurrent
                  ? const Color(0xFF2C4B6B)
                  : Colors.grey.shade400,
            ),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: stepperWidgets,
      ),
    );
  }
}
