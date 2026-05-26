import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/employer_ads_provider.dart';

class EmployerAdsView extends ConsumerWidget {
  const EmployerAdsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employerAdsState = ref.watch(employerAdsProvider);
    return employerAdsState.when(
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [...data.map((e) => Text(e.id))]),
      ),
      error: (err, stack) => Center(
        child: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            ref.read(employerAdsProvider.notifier).fetchEmployerAds();
          },
        ),
      ),

      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
