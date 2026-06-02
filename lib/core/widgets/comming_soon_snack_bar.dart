import 'package:flutter/material.dart';

class ComingSoonSnackBar extends StatelessWidget {
  const ComingSoonSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return _comingSoonWidget();
  }

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      _comingSoonWidget(),
    );
  }

  SnackBar _comingSoonWidget() => const SnackBar(
      content: Text('به زودی...', style: TextStyle(fontFamily: 'Vazirmatn')),
      duration: Duration(seconds: 2),
    );

}
