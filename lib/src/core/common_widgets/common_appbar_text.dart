

import 'package:flutter/material.dart';

import '../app_constants/app_strings.dart';

class CommonAppBarText extends StatelessWidget {
  final String text;
  const CommonAppBarText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            );
  }
}