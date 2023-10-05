import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_colors.dart';
import 'package:petcare_app/src/core/app_constants/configuration.dart';
import 'package:petcare_app/src/features/theme/pages/theme_settings.dart';
import '../../drawer/pages/about_us_ui.dart';
import '../../drawer/pages/contact_us_ui.dart';
import '../../drawer/widgets/profile_select_widget.dart';
import '../pages/module_list.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).cardColor,
      child: ListView(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const ProfileSelectWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppConfiguration.getName,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Text(
                    AppConfiguration.getEmail,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )),
          const ThemeSettings(),
          drawerTile(context, 'View Appointments', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ModuleList()));
          }, 'assets/icons/calendar.png'),
          drawerTile(context, 'about us', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsUI()));
          }, 'assets/icons/information.png'),
          drawerTile(context, 'contact us', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUsUI()));
          }, 'assets/icons/telephone.png'),
          drawerTile(context, 'logout', () {}, 'assets/icons/logout.png'),
        ],
      ),
    );
  }

  Widget drawerTile(BuildContext context, String title,
      VoidCallback callbackFunction, String image) {
    return ListTile(
      title: Row(
        children: [
          Image.asset(
            image,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
      onTap: callbackFunction,
    );
  }
}
