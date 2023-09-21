import 'package:flutter/material.dart';
import 'package:petcare_app/src/features/theme/presentation/theme_provider.dart';
import 'package:provider/provider.dart';

import 'theme_settings.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const ThemeSettings(),
    );
  }
}
