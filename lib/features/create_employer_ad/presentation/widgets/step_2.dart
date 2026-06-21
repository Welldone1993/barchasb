import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/employer_ad_provider.dart';

class Step2Details extends StatelessWidget {
  final WidgetRef ref;
  final EmployerAdState state;

  const Step2Details({super.key, required this.ref, required this.state});

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(employerAdProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        children: [
          // TODO: تبدیل این مقادیر فیک به DropdownButton واقعی با دیتاهای API
          Row(
            children: [
              Expanded(child: _buildFakeDropdown('نوع همکاری')),
              const SizedBox(width: 10),
              Expanded(child: _buildFakeDropdown('جنسیت')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildFakeDropdown('سابقه')),
              const SizedBox(width: 10),
              Expanded(child: _buildFakeDropdown('شیوه پرداخت')),
            ],
          ),

          // ... بقیه ردیف‌های دراپ‌داون به همین شکل قرار میگیرند ...
          // حداقل حقوق و حداکثر حقوق
          // ساعت شروع و پایان
          // وضعیت سربازی و سایر ویژگی‌ها
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(child: _buildPrevButton(() => notifier.prevStep())),
              const SizedBox(width: 10),
              Expanded(child: _buildNextButton(() => notifier.nextStep())),
            ],
          ),
        ],
      ),
    );
  }


// یک دراپ داون ظاهری برای تکمیل طراحی (باید با DropdownButton جایگزین شود)
  Widget _buildFakeDropdown(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(hint, style: const TextStyle(color: Colors.grey)),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(VoidCallback onPressed, {String title = 'مرحله بعد'}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2C4B6B),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildPrevButton(VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF32BDF6), // رنگ آبی روشن
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: const Text('مرحله قبل', style: TextStyle(color: Colors.white)),
      ),
    );
  }

}
