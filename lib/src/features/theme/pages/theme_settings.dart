import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/theme_provider.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
      ),
      body: Center(
          child: SwitchListTile(
              title: const Text("data"),
              value: themeProvider.darkTheme,
              onChanged: (value) {
                themeProvider.setDarkTheme = value;
              })),
    );
  }
}
