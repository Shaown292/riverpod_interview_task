import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return IconButton(
      icon: Icon(
        themeMode == ThemeMode.dark
            ? Icons.dark_mode
            : themeMode == ThemeMode.light
            ? Icons.light_mode
            : Icons.brightness_auto,
      ),
      onPressed: () {
        ref.read(themeModeProvider.notifier).state =
        themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
      },
    );
  }
}
