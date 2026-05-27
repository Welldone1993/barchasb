import 'package:barchasb/features/digital_ad/domain/entities/digital_ad_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/digital_ads_provider.dart';
import 'widgets/digital_ad_card.dart';

class DigitalAdPage extends ConsumerWidget {
  const DigitalAdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(digitalAdsProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _errorButton(e, ref),
      data: (ads) => SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => ref.read(digitalAdsProvider.notifier).refresh(),
          child: _list(ads),
        ),
      ),
    );
  }

  Widget _list(List<DigitalAdEntity> ads) => ListView.separated(
    shrinkWrap: true,
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    itemCount: ads.length,
    separatorBuilder: (_, __) => const SizedBox(height: 12),
    itemBuilder: (context, index) {
      return DigitalAdCard(digitalAd: ads[index]);
    },
  );

  Widget _errorButton(Object e, WidgetRef ref) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(e.toString()),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => ref.read(digitalAdsProvider.notifier).refresh(),
          child: const Text('تلاش مجدد'),
        ),
      ],
    ),
  );
}
