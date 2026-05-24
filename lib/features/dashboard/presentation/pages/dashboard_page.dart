import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/widgets/app_scaffold.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/dashboard_grid_button.dart';
import '../widgets/user_profile_card.dart';

final selectedDashboardSectionProvider = StateProvider<int>((ref) => 0);

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardProvider);
    final selectedIndex = ref.watch(selectedDashboardSectionProvider);
    final List<String> buttonTitles = [
      'میزکار',
      'آگهی ها',
      'آگهی دیجیتال',
      'آگهی های من',
      'اشتراک و مالی',
      'افزونه ها',
    ];

    return AppScaffold(
      title: 'داشبورد کاربر',
      body: Column(
        children: [
          UserProfileCard(),
          Column(
            children: [
              // گرید دکمه‌ها
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttonTitles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 ستون (مانند عکس)
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.2, // تنظیم نسبت عرض به ارتفاع دکمه‌ها
                  ),
                  itemBuilder: (context, index) => DashboardGridButton(
                    title: buttonTitles[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      // تغییر استیت به ایندکس جدید با کلیک
                      ref
                              .read(selectedDashboardSectionProvider.notifier)
                              .state =
                          index;
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // بخش نمایش محتوا بر اساس دکمه انتخاب شده
              _buildSectionContent(selectedIndex, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContent(int index, BuildContext context) {
    final theme = Theme.of(context);
    switch (index) {
      case 0:
        return Center(
          child: Text(
            'محتوای میزکار',
            style: TextStyle(color: theme.primaryColor),
          ),
        );
      case 1:
        return Center(
          child: Text(
            'محتوای آگهی ها',
            style: TextStyle(color: theme.primaryColor),
          ),
        );
      case 2:
        return Center(
          child: Text(
            'محتوای آگهی دیجیتال',
            style: TextStyle(color: theme.primaryColor),
          ),
        );
      case 3:
        return Center(
          child: Text(
            'محتوای آگهی های من',
            style: TextStyle(color: theme.primaryColor),
          ),
        );
      case 4:
        return Center(
          child: Text(
            'محتوای اشتراک و مالی',
            style: TextStyle(color: theme.primaryColor),
          ),
        );
      case 5:
        return Center(
          child: Text(
            'محتوای افزونه ها',
            style: TextStyle(color: theme.primaryColor),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
