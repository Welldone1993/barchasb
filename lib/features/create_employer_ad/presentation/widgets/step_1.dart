import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/employer_ad_provider.dart';

class Step1BasicInfo extends StatelessWidget {
  final WidgetRef ref;
  final EmployerAdState state;

  const Step1BasicInfo({super.key, required this.ref, required this.state});

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(employerAdProvider.notifier);
    final data = state.adData;

    return SingleChildScrollView(
      child: Column(
        children: [
          // TODO: افزودن کامپوننت انتخاب عکس پروفایل
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 8),
          const Text('عکس پروفایل'),
          const SizedBox(height: 20),

          _buildTextField(
            'نام',
            data.name,
            (val) => notifier.updateData(data.copyWith(name: val)),
          ),
          _buildTextField(
            'عنوان آگهی',
            data.title,
            (val) => notifier.updateData(data.copyWith(title: val)),
          ),

          // TODO: دراپ داون واقعی برای دسته شغلی
          _buildFakeDropdown('دسته شغلی'),

          _buildTextField(
            'توضیحات',
            data.description,
            (val) => notifier.updateData(data.copyWith(description: val)),
            maxLines: 4,
          ),

          const SizedBox(height: 30),
          _buildNextButton(() => notifier.nextStep()),
        ],
      ),
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


}
