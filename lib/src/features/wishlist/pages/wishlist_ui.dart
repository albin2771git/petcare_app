import 'package:flutter/material.dart';

import '../../../core/app_constants/app_strings.dart';
import '../../../core/utils/common_utils.dart';

class WishListUI extends StatelessWidget {
  const WishListUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context, 1),
      height: height(context, 1),
      child: const Center(
        child: Text(AppStrings.wishlist),
      ),
    );
  }
}
