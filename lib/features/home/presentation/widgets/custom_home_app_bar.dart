// lib/features/home/presentation/widgets/custom_home_app_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Image.asset('assets/images/logo.png', height: 32), // لوگوی خود را اینجا قرار دهید
      actions: [
        TextButton(
          onPressed: () => context.push('/login'),
          child: const Text('ورود'),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: () => context.push('/register'),
          child: const Text('ثبت نام'),
        ),
        const SizedBox(width: 16),
      ],
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () { /* TODO: Open drawer */ },
      ),
    );
  }
}
