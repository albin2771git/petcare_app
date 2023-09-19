import 'package:flutter/material.dart';
import '../app_constants/app_colors.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final Color enabledBorderColor;
  final double radius;
  final TextEditingController controller;
  final Color textColor;
  const CommonTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.borderColor = AppColors.white,
      this.radius = 8,  this.enabledBorderColor=AppColors.white,  this.textColor=AppColors.white,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.white,
      style:  TextStyle(color: textColor, fontSize: 14),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: enabledBorderColor),
              borderRadius: BorderRadius.circular(radius)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(radius)),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12, color: AppColors.white)),
    );
  }
}
