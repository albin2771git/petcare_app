import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/utils/common_utils.dart';

import '../../../core/app_constants/app_strings.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context, 1),
      height: height(context, 1),
      child: const Center(
        child: Text(AppStrings.home),
      ),
    );
  }
}
