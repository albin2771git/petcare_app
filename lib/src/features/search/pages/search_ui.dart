import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_strings.dart';
import 'package:petcare_app/src/core/utils/common_utils.dart';

class SearchUI extends StatelessWidget {
  const SearchUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardTheme.color,
      width: width(context, 1),
      height: height(context, 1),
      child: Center(
        child: Text(
          AppStrings.search,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
