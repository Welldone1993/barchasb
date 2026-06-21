import 'package:flutter/material.dart';

import '../providers/employer_ad_provider.dart';

class Step5FinalStatus extends StatelessWidget {
  final EmployerAdState state;

  const Step5FinalStatus({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.isSubmitting) ...[
          const Text(
            'در انتظار تائید ...',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          const CircularProgressIndicator(color: Colors.orange),
          // TODO: Lottie animation
        ] else if (state.isSuccess) ...[
          const Icon(Icons.check_circle, color: Colors.green, size: 80),
          const SizedBox(height: 20),
          const Text('آگهی با موفقیت ثبت شد', style: TextStyle(fontSize: 18)),
        ],

        const SizedBox(height: 40),
        const Text(
          'جزئیات آگهی به پشتیبانی فرستاده شد و در حال بررسی است\nلطفا صبور باشید',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const Spacer(),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2C4B6B),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              // TODO: Navigate back to Dashboard Route
              Navigator.of(context).pop();
            },
            child: const Text(
              'برو به میز کار',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
