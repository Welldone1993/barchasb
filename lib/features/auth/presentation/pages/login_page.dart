import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final TextEditingController phonecontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppBackButton(onPressed: () => context.pop()),
                ),
                const SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Text('ورود', style: theme.textTheme.displayMedium),
                            const SizedBox(height: 30),

                            AppTextField(
                              controller: phonecontroller,
                              hintText: 'شماره موبایل',
                              icon: Icons.phone,
                              isNumber: true,
                            ),
                            const SizedBox(height: 16),

                            AppTextField(
                              controller: passwordcontroller,
                              hintText: 'رمز عبور',
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: 24),

                            AppElevatedButton(
                              onPressed: () {
                                ref
                                    .read(authProvider.notifier)
                                    .login(
                                      phonecontroller.text.trim(),
                                      passwordcontroller.text.trim(),
                                    );
                              },
                              text: 'ورود',
                            ),
                            const SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTextButton(
                                  onPressed: () => context.push('/register'),
                                  text: 'ثبت نام',
                                ),
                                AppTextButton(
                                  onPressed: () {},
                                  text: 'فراموشی رمز عبور',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.sticky_note_2,
                            color: colorScheme.secondary,
                            size: 80,
                          ),
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
    );
  }
}
