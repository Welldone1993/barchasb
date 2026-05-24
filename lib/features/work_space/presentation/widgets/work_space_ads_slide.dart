import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/work_space_ads_provider.dart';

class WorkSpaceAdsSlide extends ConsumerWidget {
  const WorkSpaceAdsSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final statsState = ref.watch(workSpaceAdsProvider);

    return statsState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text('خطا در دریافت اطلاعات$error')),
      data: (statsData) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [...statsData.map((e) => Text(e.adId))]),
      ),
    );
  }
}
