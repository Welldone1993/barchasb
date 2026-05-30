// lib/features/home/presentation/pages/home_page.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_provider.dart';
import '../widgets/custom_home_app_bar.dart';
import '../widgets/home_scaffold_screen.dart';
import '../widgets/horizontal_list_view_handler.dart';
import '../widgets/search_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Widget buildAdImage(String? url) {
    if (url == null || url.isEmpty) {
      return Image.asset('assets/images/placeholder.png'); // عکس پیش‌فرض
    }

    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);

    return HomeScaffoldScreen(
      // با کشیدن صفحه به پایین، اطلاعات رفرش می‌شود
      body: RefreshIndicator(
        onRefresh: homeNotifier.fetchAll,
        child: CustomScrollView(
          slivers: [

            // بخش 2: جستجو و عنوان
            const SearchSection(),

            // یک فاصله کوچک
            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // بخش 3: لیست فروشندگان
            SliverToBoxAdapter(
              child: HorizontalListViewHandler(
                title: 'فروشندگان',
                state: homeState.sellers,
                onRetry: homeNotifier.fetchSellers,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // بخش 4: لیست کارفرمایان
            SliverToBoxAdapter(
              child: HorizontalListViewHandler(
                title: 'کارفرمایان',
                state: homeState.employers,
                onRetry: homeNotifier.fetchEmployers,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // بخش 5: لیست کارجویان
            SliverToBoxAdapter(
              child: HorizontalListViewHandler(
                title: 'کارجویان',
                state: homeState.jobSeekers,
                onRetry: homeNotifier.fetchJobSeekers,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
