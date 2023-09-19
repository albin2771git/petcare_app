import 'package:flutter/material.dart';
import '../../../core/app_constants/app_colors.dart';

class ProfileSelectWidget extends StatelessWidget {
  const ProfileSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                'assets/images/person.jpg',
              )),
          Positioned(
            bottom: 0,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary2,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
