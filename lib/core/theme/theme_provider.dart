import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'app_theme.dart';
import 'package:flutter/material.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final themeProvider = Provider<ThemeData>((ref) {
  final mode = ref.watch(themeModeProvider);

  return AppTheme.lightTheme;
});
