import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/job_seeker_ads_provider.dart';

class JobSeekerAdsView extends ConsumerWidget {
  const JobSeekerAdsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobSeekerAdsState = ref.watch(jobSeekerAdsProvider);
    return jobSeekerAdsState.when(
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [...data.map((e) => Text(e.id ?? ''))]),
      ),
      error: (err, stack) => Center(
        child: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            ref.read(jobSeekerAdsProvider.notifier).fetchJobSeekerAds();
          },
        ),
      ),

      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
