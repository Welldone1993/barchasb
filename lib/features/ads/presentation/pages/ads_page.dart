import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdsPage extends ConsumerWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Center(
      child: Text('Ads', style: TextStyle(color: theme.primaryColor)),
    );
  }
}
