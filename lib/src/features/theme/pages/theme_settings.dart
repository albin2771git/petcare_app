import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_colors.dart';
import 'package:provider/provider.dart';
import '../presentation/theme_provider.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Consumer<ThemeProvider>(builder: (context, value2, child) {
      return ListTile(
          title: Row(
            children: [
              Image.asset(
                value2.darkTheme
                    ? 'assets/icons/night-mode.png'
                    : 'assets/icons/moon.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                value2.darkTheme ? 'Light Mode' : 'Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
          trailing: Switch(
            value: value2.darkTheme,
            onChanged: (value) {
              value2.setterDarkTheme = value;
            },
            activeColor: AppColors.primaryColor,
            activeTrackColor: AppColors.primaryColor.withOpacity(0.5),
            inactiveThumbColor: AppColors.greyColor,
            inactiveTrackColor: AppColors.greyColor.withOpacity(0.5),
          ));
    }));
  }
}
