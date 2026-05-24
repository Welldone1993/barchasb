import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DigitalAdPage extends ConsumerWidget {
  const DigitalAdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Center(
      child: Text('Digital Ad', style: TextStyle(color: theme.primaryColor)),
    );
  }
}
