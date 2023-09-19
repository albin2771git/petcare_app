import 'package:flutter/material.dart';

import '../../../core/app_constants/app_colors.dart';
import '../widgets/profile_select_widget.dart';

class ProfileUi extends StatelessWidget {
  const ProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileUi'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: AppColors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: const [
          ProfileSelectWidget()
          ],
      ),
    );
  }
}
