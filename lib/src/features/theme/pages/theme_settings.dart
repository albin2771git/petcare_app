import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/theme_provider.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Settings'),
        ),
        body: Center(
            child: Consumer<ThemeProvider>(builder: (context, value2, child) {
          return Column(
            children: [
              Text(value2.isDarkTheme.toString()),
              SwitchListTile(
                  title: const Text("data"),
                  value: value2.isDarkTheme,
                  onChanged: (value) {
                    value2.toggleTheme();
                  }),
            ],
          );
        })));
  }
}
