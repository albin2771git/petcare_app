import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare_app/src/core/common_widgets/toast.dart';

import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/endpoints.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  Future<bool> login(BuildContext context, dynamic body) async {
    setLoading(true);
    var url = Uri.parse(baseUrl + ApiEndPoints.loginEndpoints);
    debugPrint(
        "-------------------------$url---------------------------------");
    debugPrint("body: $body");

    var response = await http.post(
      url,
      body: body,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint("response.body: ${response.body}");
    if (response.statusCode == 200) {
      if (context.mounted) {
        CreateSuccessToast(context: context, message: AppStrings.loginSuccess);
      }
    } else {
      if (context.mounted) {
        CommonCreateFunction.uploadFailFunction(
            context, AppStrings.loginFailed);
      }
    }

    setLoading(false);
    return response.statusCode == 200 ? true : false;
  }
}
