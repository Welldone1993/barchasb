import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_scaffold.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return AppScaffold(
      title: 'خانه',
      showBack: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppElevatedButton(
              text: 'ورود به صفحه لاگین',
              onPressed: () => context.push('/login'),
            ),
            Text(
              themeMode == ThemeMode.light
                  ? 'Light Mode'
                  : 'Dark Mode',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(themeModeProvider.notifier).state =
                themeMode == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
              },
              child: const Text('Toggle Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
