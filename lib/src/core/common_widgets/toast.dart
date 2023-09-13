import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare_app/src/core/app_constants/app_colors.dart';


class CreateSuccessToast {
  final BuildContext context;
  final String message;
  final FToast _fToast = FToast();

  CreateSuccessToast({
    required this.context,
    required this.message,
  }) {
    _fToast.init(context);
    _fToast.showToast(
        child: _buildToast(),
        toastDuration: const Duration(seconds: 1),
        gravity: ToastGravity.BOTTOM);
  }

  Widget _buildToast() {
    return Container(
      height: 50,
      color: AppColors.greyColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 50, width: 6, color: AppColors.limeGreen),
          SizedBox(
            height: 50,
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  const CircleAvatar(
                    backgroundColor: AppColors.limeGreen,
                    radius: 12,
                    child: Icon(Icons.done, color: AppColors.white, size: 14),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  regularTextWithStyle(context, message,
                      fontWeight: FontWeight.w500)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
//---------------------------------------------------------------

//---------------------------------------------------------------
  Widget regularTextWithStyle(BuildContext context, String title,
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.start,
      TextOverflow textOverflow = TextOverflow.visible,
      Color color = AppColors.white}) {
    return Text(
      title,
      style: GoogleFonts.ibmPlexSans(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}

class CreateFailToast {
  final BuildContext context;
  final String message;
  final FToast _fToast = FToast();

  CreateFailToast({
    required this.context,
    required this.message,
  }) {
    _fToast.init(context);
    _fToast.showToast(
        child: _buildToast(),
        toastDuration: const Duration(seconds: 1),
        gravity: ToastGravity.BOTTOM);
  }

  Widget _buildToast() {
    return Container(
      height: 50,
      color: AppColors.greyColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 50, width: 6, color: AppColors.red),
          SizedBox(
            height: 50,
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  const CircleAvatar(
                    backgroundColor: AppColors.red,
                    radius: 12,
                    child: Icon(Icons.clear, color: AppColors.white, size: 14),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  regularTextWithStyle(context, message,
                      fontWeight: FontWeight.w500)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget regularTextWithStyle(BuildContext context, String title,
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.start,
      TextOverflow textOverflow = TextOverflow.visible,
      Color color = AppColors.white}) {
    return Text(
      title,
      style: GoogleFonts.ibmPlexSans(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}

class CommonCreateFunction {
  static createSuccessFunction(BuildContext context, String msg) {
    CreateSuccessToast(context: context, message: msg);
    Future.delayed(const Duration(milliseconds: 500), () {
  //  Navigator.pop(context, true);
    });
  }

  static uploadFailFunction(BuildContext context, String msg) {
    CreateFailToast(context: context, message: msg);
    Future.delayed(const Duration(milliseconds: 1500), () {
  // Navigator.pop(context, true);
    });
  }
}