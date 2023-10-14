import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/utils/common_utils.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context,1),
      height: height(context,1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Profile UI'),
        ],
      ),
    );
  }
}
