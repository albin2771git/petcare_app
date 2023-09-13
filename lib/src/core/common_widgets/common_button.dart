import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double radius;

  const CommonButtonWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onPressed,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme.bodyMedium
              ?.copyWith(color: textColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
