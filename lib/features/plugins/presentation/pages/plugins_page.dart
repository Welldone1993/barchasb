import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PluginsPage extends ConsumerWidget {
  const PluginsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Center(
      child: Text('PluginsPage', style: TextStyle(color: theme.primaryColor)),
    );
  }
}
