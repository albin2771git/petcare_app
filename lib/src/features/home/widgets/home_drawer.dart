import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_colors.dart';
import 'package:petcare_app/src/core/app_constants/app_strings.dart';
import 'package:petcare_app/src/core/app_constants/configuration.dart';

import '../../drawer/pages/profile_ui.dart';
import '../pages/module_list.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: AppColors.primary2,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/person.jpg')),
                    ),
                  ),
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
          drawerTile(context, 'View Profile', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileUi()));
          }, 'assets/icons/user.png'),
          drawerTile(context, 'View Appointments', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ModuleList()));
          }, 'assets/icons/calendar.png'),
          drawerTile(
              context, 'about us', () {}, 'assets/icons/information.png'),
          drawerTile(
              context, 'contact us', () {}, 'assets/icons/telephone.png'),
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
            width: 25,
            height: 25,
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
