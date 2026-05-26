import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/seller_ads_provider.dart';

class SellerAdsView extends ConsumerWidget {
  const SellerAdsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellerAdsState = ref.watch(sellerAdsProvider);
    return sellerAdsState.when(
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [...data.map((e) => Text(e.id))]),
      ),
      error: (err, stack) => Center(
        child: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            ref.read(sellerAdsProvider.notifier).fetchSellerAds();
          },
        ),
      ),

      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
