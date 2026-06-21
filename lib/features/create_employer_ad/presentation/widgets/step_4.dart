import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/employer_ad_provider.dart';

class Step4Verification extends StatelessWidget {
  final WidgetRef ref;
  final EmployerAdState state;

  const Step4Verification({super.key, required this.ref, required this.state});

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(employerAdProvider.notifier);
    final data = state.adData;

    return Column(
      children: [
        const Text('تائید شماره ی 09123456789 با کد پیامک'),
        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildTextField(
                'کد ارسال شده را وارد کنید',
                data.smsCode,
                (val) => notifier.updateData(data.copyWith(smsCode: val)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C4B6B),
                ),
                onPressed: () {
                  // TODO: Call API to send code
                },
                child: const Text(
                  'ارسال کد',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 40),

        CheckboxListTile(
          title: const Text('پیام در چت برچسب'),
          value: data.isChatEnabled,
          onChanged: (val) =>
              notifier.updateData(data.copyWith(isChatEnabled: val)),
        ),
        CheckboxListTile(
          title: const Text('تماس تلفنی'),
          value: data.isCallEnabled,
          onChanged: (val) =>
              notifier.updateData(data.copyWith(isCallEnabled: val)),
        ),

        const Spacer(),
        Row(
          children: [
            Expanded(child: _buildPrevButton(() => notifier.prevStep())),
            const SizedBox(width: 10),
            // در این مرحله تابع نهایی سابمیت صدا زده می‌شود
            Expanded(
              child: _buildNextButton(
                () => notifier.submitAd(),
                title: 'ثبت نهایی',
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- Helper Functions for UI Builders ---
  Widget _buildTextField(
    String hint,
    String initialValue,
    Function(String) onChanged, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(
    VoidCallback onPressed, {
    String title = 'مرحله بعد',
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2C4B6B),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: const Text('مرحله قبل', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
