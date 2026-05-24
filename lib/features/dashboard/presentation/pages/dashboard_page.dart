import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/widgets/app_scaffold.dart';
import '../../../ads/presentation/pages/ads_page.dart';
import '../../../digital_ad/presentation/pages/digital_ad_page.dart';
import '../../../my_ads/presentation/pages/my_ads_page.dart';
import '../../../plugins/presentation/pages/plugins_page.dart';
import '../../../subscription/presentation/pages/subscription_page.dart';
import '../../../work_space/presentation/pages/work_space_page.dart';
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
    switch (index) {
      case 0:
        return WorkSpacePage();
      case 1:
        return AdsPage();
      case 2:
        return DigitalAdPage();
      case 3:
        return MyAdsPage();
      case 4:
        return SubscriptionPage();
      case 5:
        return PluginsPage();
      default:
        return const SizedBox.shrink();
    }
  }
}
