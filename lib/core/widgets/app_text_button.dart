import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppTextButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: onPressed, child: Text(text));
}
