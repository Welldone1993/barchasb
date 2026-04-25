import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBack;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: showBack
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}
