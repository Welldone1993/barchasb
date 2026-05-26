import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/digital_ads_provider.dart';

class DigitalAdPage extends ConsumerWidget {
  const DigitalAdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final digitalAdsState = ref.watch(digitalAdsProvider);
    return digitalAdsState.when(
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [...data.map((e) => Text(e.id))]),
      ),
      error: (err, stack) => Center(
        child: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            ref.read(digitalAdsProvider.notifier).fetchDigitalAds();
          },
        ),
      ),

      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
