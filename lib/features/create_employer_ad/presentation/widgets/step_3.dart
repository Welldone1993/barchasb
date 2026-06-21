import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/employer_ad_provider.dart';

class Step3Payment extends StatelessWidget {
  final WidgetRef ref;
  final EmployerAdState state;

  const Step3Payment({super.key, required this.ref, required this.state});

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(employerAdProvider.notifier);
    final data = state.adData;

    return Column(
      children: [
        const Text(
          'تعداد امتیاز اشتراک : ۳',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'موجودی کیف پول : ۱۰۰.۰۰۰ تومان',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),

        // TODO: ساخت استایل رادیو باتن‌ها مشابه دیزاین
        RadioListTile<String>(
          title: const Text('پرداخت از طریق اشتراک'),
          value: 'subscription',
          groupValue: data.selectedPaymentMethod,
          onChanged: (val) =>
              notifier.updateData(data.copyWith(selectedPaymentMethod: val)),
        ),
        RadioListTile<String>(
          title: const Text('پرداخت از طریق کیف پول'),
          value: 'wallet',
          groupValue: data.selectedPaymentMethod,
          onChanged: (val) =>
              notifier.updateData(data.copyWith(selectedPaymentMethod: val)),
        ),
        RadioListTile<String>(
          title: const Text('پرداخت با کارت بانکی'),
          value: 'bank',
          groupValue: data.selectedPaymentMethod,
          onChanged: (val) =>
              notifier.updateData(data.copyWith(selectedPaymentMethod: val)),
        ),

        const Spacer(),
        Row(
          children: [
            Expanded(child: _buildPrevButton(() => notifier.prevStep())),
            const SizedBox(width: 10),
            Expanded(child: _buildNextButton(() => notifier.nextStep())),
          ],
        ),
      ],
    );
  }
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
