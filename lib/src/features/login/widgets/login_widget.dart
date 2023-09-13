import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_strings.dart';
import 'package:petcare_app/src/core/common_widgets/common_textfield.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/common_widgets/common_button.dart';
import '../../../core/common_widgets/toast.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextFieldWidget(
                hintText: "Enter your email", controller: emailController),
            const SizedBox(height: 20),
            CommonTextFieldWidget(
                hintText: "Enter your password",
                controller: passwordController),
            const SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonButtonWidget(
                    width: 90,
                    height: 32,
                    color: AppColors.primary2,
                    radius: 8,
                    textColor: AppColors.white,
                    text: "Cancel",
                    onPressed: () {},
                  ),
                  CommonButtonWidget(
                    width: 90,
                    height: 32,
                    color: AppColors.primary2,
                    radius: 8,
                    textColor: AppColors.white,
                    text: "Login",
                    onPressed: () {
                      if (emailController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty) {
                        CreateSuccessToast(
                            context: context, message: AppStrings.loginSuccess);
                      } else {
                        CommonCreateFunction.uploadFailFunction(
                            context, AppStrings.enterVAlidValues);
                      }
                    },
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
