import 'package:flutter_riverpod/legacy.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'job_seeker_ads.dart';

final adSegmentProvider = StateProvider<int>((ref) => 0);

class CustomAdSegmentView extends ConsumerWidget {
  const CustomAdSegmentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(adSegmentProvider);

    return Column(
      children: [
        _header(ref, selectedIndex),
        const SizedBox(height: 16),
        _buildTabWidget(selectedIndex),
      ],
    );
  }

  Widget _header(WidgetRef ref, int selectedIndex) => Row(
    children: [
      Expanded(child: _tabs(ref, selectedIndex)),
      const SizedBox(width: 8),
      _filterButton(),
    ],
  );

  Widget _tabs(WidgetRef ref, int selectedIndex) => Container(
    height: 48,
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        _buildTabItem(
          ref,
          title: 'کارجو',
          index: 0,
          selectedIndex: selectedIndex,
        ),
        _buildTabItem(
          ref,
          title: 'کارفرما',
          index: 1,
          selectedIndex: selectedIndex,
        ),
        _buildTabItem(
          ref,
          title: 'آگهی ها',
          index: 2,
          selectedIndex: selectedIndex,
        ),
      ],
    ),
  );

  Widget _filterButton() => Container(
    height: 48,
    width: 48,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: IconButton(
      icon: const Icon(Icons.tune, color: Color(0xFF1C3A5A)),
      onPressed: () {
        // TODO: باز کردن باتم‌شیت یا صفحه فیلترها
      },
    ),
  );

  Widget _buildTabWidget(int selectedIndex) => IndexedStack(
    index: selectedIndex,
    children: const [
      // Index 0
      JobSeekerAdsView(),
      // Index 1
      Center(child: Text('ویجت کارفرما')),
      // Index 2
      Center(child: Text('ویجت آگهی ها')),
    ],
  );

  Widget _buildTabItem(
    WidgetRef ref, {
    required String title,
    required int index,
    required int selectedIndex,
  }) {
    final isSelected = index == selectedIndex;
    final activeColor = const Color(0xFF1E4064);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(adSegmentProvider.notifier).state = index;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : activeColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
