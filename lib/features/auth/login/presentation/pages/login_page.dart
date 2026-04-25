import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../presentation/providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return AppScaffold(
      title: 'ورود',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: phoneController,
            label: 'شماره موبایل',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: passwordController,
            label: 'رمز عبور',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          AppElevatedButton(
            text: auth.isLoading ? 'در حال ارسال...' : 'ورود',
            onPressed: () {
              ref.read(authProvider.notifier).login(
                phoneController.text,
                passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
