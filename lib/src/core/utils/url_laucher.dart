import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_constants/app_strings.dart';
import '../common_widgets/toast.dart';

launchUrlFunction(BuildContext context, url, String type) async {
  try {
    if (await canLaunchUrl(Uri(scheme: type, path: url))) {
      await launchUrl(Uri(scheme: type, path: url));
    }
  } catch (e) {
    CommonCreateFunction.uploadFailFunction(context, AppStrings.tryAgainLater);
  }
}

launchSms(BuildContext context, phoneNumber, {String msgString = ''}) async {
  try {
    if (Platform.isAndroid) {
      String uri = 'sms:$phoneNumber?body=${Uri.encodeComponent(msgString)}';
      await launchUrl(Uri.parse(uri));
    } else if (Platform.isIOS) {
      String uri = 'sms:$phoneNumber&body=${Uri.encodeComponent(msgString)}';
      await launchUrl(Uri.parse(uri));
    }
  } catch (e) {
    CommonCreateFunction.uploadFailFunction(context, AppStrings.tryAgainLater);
  }
}

openWhatsapp(BuildContext context, String number,
    {String msgString = ''}) async {
  if (number != "") {
    try {
      String whatsappAndroidUrl =
          "https://wa.me/$number/?text=${Uri.parse(msgString)}";
      String whatsappIosUrl =
          "https://api.whatsapp.com/send?phone=$number=${Uri.parse(msgString)}";

      if (defaultTargetPlatform == TargetPlatform.iOS) {
        if (await canLaunchUrl(Uri.parse(whatsappIosUrl))) {
          await launchUrl(Uri.parse(whatsappIosUrl));
        } else {
          if (context.mounted) {
            CommonCreateFunction.uploadFailFunction(
                context, AppStrings.tryAgainLater);
          }
        }
      } else {
        if (await canLaunchUrl(Uri.parse(whatsappAndroidUrl))) {
          await launchUrl(Uri.parse(whatsappAndroidUrl),
              mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            CommonCreateFunction.uploadFailFunction(
                context, AppStrings.tryAgainLater);
          }
        }
      }
    } catch (ex) {
      if (context.mounted) {
        CommonCreateFunction.uploadFailFunction(
            context, AppStrings.tryAgainLater);
      }
    }
  } else {
    if (context.mounted) {
      CommonCreateFunction.uploadFailFunction(
          context, AppStrings.tryAgainLater);
    }
  }
}

callLaunch(BuildContext context, String number) async {
  if (number != "") {
    try {
      if (await canLaunchUrl(Uri(scheme: 'tel', path: number))) {
        await launchUrl(Uri(scheme: 'tel', path: number));
      }
    } catch (e) {
      if (context.mounted) {
        CommonCreateFunction.uploadFailFunction(
            context, AppStrings.tryAgainLater);
      }
    }
  } else {
    if (context.mounted) {
      CommonCreateFunction.uploadFailFunction(
          context, AppStrings.tryAgainLater);
    }
  }
}
