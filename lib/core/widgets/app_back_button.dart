import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) => IconButton(
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Theme.of(context).colorScheme.primary,
        size: 32,
      ),
      onPressed: onPressed,
    );
}
