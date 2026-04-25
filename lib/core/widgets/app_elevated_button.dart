import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppElevatedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
      child: Text(text),
    );
  }
}
