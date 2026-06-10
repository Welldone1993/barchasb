import 'package:barchasb/features/auth/domain/entities/province_entity.dart';
import 'package:barchasb/features/auth/presentation/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../core/utils/extension/string_extensions.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../domain/entities/register_entity.dart';
import '../widgets/security_verification_dialog.dart';

enum Gender { male, female }

extension GenderExtension on Gender {
  String get label {
    switch (this) {
      case Gender.male:
        return 'مرد';
      case Gender.female:
        return 'زن';
    }
  }
}

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _nationalIdCtrl = TextEditingController();
  final _birthDateCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  Gender? _selectedGender;
  bool _termsAccepted = false;

  ProvinceEntity? _selectedProvince;
  String? _selectedCity;
  List<String> _currentCities = [];

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _phoneCtrl.dispose();
    _nationalIdCtrl.dispose();
    _birthDateCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _selectBirthDate() async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1300, 1),
      lastDate: Jalali.now(),
    );

    if (picked != null) {
      setState(() {
        String formattedDate = '${picked.year}/${picked.month}/${picked.day}';
        _birthDateCtrl.text = formattedDate.toPersianDigits;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _termsAccepted) {
      final registerData = RegisterEntity(
        firstName: _firstNameCtrl.text,
        lastName: _lastNameCtrl.text,
        phoneNumber: _phoneCtrl.text,
        nationalId: _nationalIdCtrl.text,
        birthDate: _birthDateCtrl.text,
        gender: _selectedGender?.label ?? '',
        province: _selectedProvince.toString(),
        city: _selectedCity ?? '',
        password: _passwordCtrl.text,
      );
      ref.read(registerProvider.notifier).register(registerData);
    } else if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('لطفا قوانین سایت را بپذیرید'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(registerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppBackButton(onPressed: () => context.pop()),
                        ),
                        AppTextButton(
                          text: 'ثبت نام',
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => SecurityVerificationDialog(
                                phoneNumber: _phoneCtrl.text,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            controller: _firstNameCtrl,
                            hintText: 'نام',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            controller: _lastNameCtrl,
                            hintText: 'نام خانوادگی',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            controller: _phoneCtrl,
                            hintText: 'شماره تلفن',
                            icon: Icons.phone_enabled,
                            isNumber: true,
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            controller: _nationalIdCtrl,
                            hintText: 'کد ملی',
                            icon: Icons.badge,
                            isNumber: true,
                          ),
                          const SizedBox(height: 12),

                          AppTextField(
                            controller: _birthDateCtrl,
                            hintText: 'تاریخ تولد',
                            icon: Icons.calendar_month,
                            readOnly: true,
                            onTap: _selectBirthDate,
                          ),
                          const SizedBox(height: 12),

                          _buildDropdown<Gender>(
                            value: _selectedGender,
                            hint: 'جنسیت',
                            icon: Icons.person,
                            items: Gender.values
                                .map(
                                  (g) => DropdownMenuItem(
                                    value: g,
                                    child: Text(g.label),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) =>
                                setState(() => _selectedGender = val),
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(
                                child: _buildDropdown<ProvinceEntity>(
                                  value: _selectedProvince,
                                  hint: 'استان',
                                  icon: Icons.location_on,
                                  items: authState.provinces
                                      .map(
                                        (p) => DropdownMenuItem<ProvinceEntity>(
                                          value: p,
                                          child: Text(p.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _selectedProvince = val;
                                      _selectedCity = null;
                                      _currentCities = val?.cities ?? [];
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildDropdown<String>(
                                  value: _selectedCity,
                                  hint: 'شهر',
                                  icon: Icons.location_city,
                                  items: _currentCities
                                      .map(
                                        (c) => DropdownMenuItem<String>(
                                          value: c,
                                          child: Text(c),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: _selectedProvince == null
                                      ? null
                                      : (val) =>
                                            setState(() => _selectedCity = val),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          AppTextField(
                            controller: _passwordCtrl,
                            hintText: 'رمز عبور',
                            icon: Icons.lock,
                            isPassword: true,
                          ),
                          const SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _termsAccepted,
                                activeColor: colorScheme.primary,
                                onChanged: (val) => setState(
                                  () => _termsAccepted = val ?? false,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: theme.textTheme.bodyMedium,
                                  children: [
                                    TextSpan(
                                      text: 'قوانین سایت',
                                      style: TextStyle(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' را خوانده‌ام و می‌پذیرم',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          AppElevatedButton(
                            onPressed: _submitForm,
                            text: 'ثبت نام',
                            isLoading: authState.isLoading,
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextButton(
                                onPressed: () {},
                                text: 'ثبت نام با ایمیل',
                              ),
                              AppTextButton(
                                onPressed: () {},
                                text: 'قبلا ثبت نام کرده اید؟',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.share, color: colorScheme.onPrimary),
                            const SizedBox(width: 8),
                            Text(
                              'کد دعوت دارید؟',
                              style: TextStyle(color: colorScheme.onPrimary),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white24),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.sticky_note_2,
                            color: colorScheme.secondary,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T? value,
    required String hint,
    required IconData icon,
    required List<DropdownMenuItem<T>> items,
    required void Function(T?)? onChanged,
  }) {
    // استفاده از استایل‌های تم گلوبال (InputDecorationTheme)
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration: InputDecoration(hintText: hint, prefixIcon: Icon(icon)),
      validator: (val) => val == null ? 'لطفا $hint را انتخاب کنید' : null,
      isExpanded: true,
      alignment: Alignment.centerRight,
    );
  }
}
