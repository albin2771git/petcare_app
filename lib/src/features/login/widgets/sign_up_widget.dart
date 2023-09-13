import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/common_widgets/common_textfield.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/common_widgets/common_button.dart';
import '../../../core/common_widgets/toast.dart';
import '../../../core/utils/common_utils.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextFieldWidget(
              hintText: "Enter your name", controller: nameController),
          const SizedBox(height: 20),
          CommonTextFieldWidget(
              hintText: "Enter your mobile number",
              controller: numberController),
          const SizedBox(height: 20),
          CommonTextFieldWidget(
              hintText: "Enter your email", controller: emailController),
          const SizedBox(height: 20),
          CommonTextFieldWidget(
              hintText: "Enter your password", controller: passwordController),
          const SizedBox(height: 20),
          CommonTextFieldWidget(
              hintText: "Enter your password again",
              controller: passwordAgainController),
          const SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonButtonWidget(
                  width: 90,
                  height: 32,
                  color: AppColors.primary2,
                  radius: 12,
                  textColor: AppColors.white,
                  text: "Cancel",
                  onPressed: () {},
                ),
                CommonButtonWidget(
                  width: 90,
                  height: 32,
                  color: AppColors.primary2,
                  radius: 12,
                  textColor: AppColors.white,
                  text: "Sign Up",
                  onPressed: () {
                    if (nameController.text.trim().isNotEmpty &&
                        numberController.text.trim().isNotEmpty &&
                        emailController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty &&
                        passwordAgainController.text.trim().isNotEmpty) {
                      CreateSuccessToast(
                          context: context,
                          message: AppStrings.registrationSuccessfull);
                    } else {
                      CommonCreateFunction.uploadFailFunction(
                          context, AppStrings.enterVAlidValues);
                    }
                  },
                )
              ]),
        ],
      ),
    );
  }
}
