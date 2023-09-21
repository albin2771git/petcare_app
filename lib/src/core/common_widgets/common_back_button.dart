import 'package:flutter/material.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).iconTheme.color,
        ));
  }
}
