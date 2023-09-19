import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare_app/src/core/app_constants/configuration.dart';
import 'package:petcare_app/src/core/common_widgets/toast.dart';

import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/endpoints.dart';
import '../data/login_data_model.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  LoginDataModel loginDataModel = LoginDataModel();

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  Future<bool> login(BuildContext context, dynamic body) async {
    var isSuccess = false;
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
      loginDataModel = loginDataModelFromJson(response.body);
      debugPrint("loginDataModel: ${loginDataModel.data?.message.toString()}");
      loginDataModel.success == true ? isSuccess = true : isSuccess = false;
      if (isSuccess) {
        if (context.mounted) {
          CreateSuccessToast(
              context: context, message: AppStrings.loginSuccess);
        }
        AppConfiguration.name = loginDataModel.data?.value["name"] ?? "";
        AppConfiguration.image = loginDataModel.data?.value["image"] ?? "";
        AppConfiguration.email = loginDataModel.data?.value["username"] ?? "";
        AppConfiguration.phoneNumber =
            loginDataModel.data?.value["phoneNumber"];
      } else {
        if (context.mounted) {
          CommonCreateFunction.uploadFailFunction(
              context, loginDataModel.data?.message.toString() ?? "");
        }
      }
    } else {
      if (context.mounted) {
        CommonCreateFunction.uploadFailFunction(
            context, AppStrings.loginFailed);
      }
    }

    setLoading(false);
    return isSuccess;
  }

  //------------------------Register---------------------------------
  Future<bool> register(BuildContext context, dynamic body) async {
    var isSuccess = false;
    setLoading(true);
    var url = Uri.parse(baseUrl + ApiEndPoints.signUpEndpoints);
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
      loginDataModel = loginDataModelFromJson(response.body);
      debugPrint("loginDataModel: ${loginDataModel.data?.message.toString()}");
      loginDataModel.success == true ? isSuccess = true : isSuccess = false;
      if (isSuccess) {
        if (context.mounted) {
          CreateSuccessToast(
              context: context, message: AppStrings.signUpSuccess);
        }
      } else {
        if (context.mounted) {
          CommonCreateFunction.uploadFailFunction(
              context, loginDataModel.data?.message.toString() ?? "");
        }
      }
    } else {
      if (context.mounted) {
        CommonCreateFunction.uploadFailFunction(
            context, AppStrings.signUpFailedCheck);
      }
    }

    setLoading(false);
    return isSuccess;
  }
}
