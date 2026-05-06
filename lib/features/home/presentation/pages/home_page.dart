import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_scaffold.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => AppScaffold(
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
        ],
      ),
    ),
  );
}
