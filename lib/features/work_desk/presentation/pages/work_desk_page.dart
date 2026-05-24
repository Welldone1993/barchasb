import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkDeskPage extends ConsumerWidget {
  const WorkDeskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Center(
      child: Text('میزکار', style: TextStyle(color: theme.primaryColor)),
    );
  }
}
