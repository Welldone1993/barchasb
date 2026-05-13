import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dashboard_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('داشبورد کاربر')),
      body: Center(
        child: dashboardState.when(
          loading: () => const CircularProgressIndicator(),

          error: (error, stackTrace) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('خطا: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(dashboardProvider.notifier).fetchUser();
                },
                child: const Text('تلاش مجدد'),
              ),
            ],
          ),

          // وضعیت موفقیت و دریافت داده
          data: (user) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'خوش آمدید، ${user.name} ${user.lastName}!',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  UserInfoTile(
                    icon: Icons.person,
                    title: 'نقش',
                    value: user.role,
                  ),
                  UserInfoTile(
                    icon: Icons.phone,
                    title: 'شماره تماس',
                    value: user.phone,
                  ),
                  UserInfoTile(
                    icon: Icons.perm_identity,
                    title: 'ID کاربر',
                    value: user.id,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const UserInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
