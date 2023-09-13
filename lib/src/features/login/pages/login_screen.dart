import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare_app/src/core/utils/common_utils.dart';
import 'package:petcare_app/src/features/login/widgets/login_widget.dart';
import 'package:petcare_app/src/features/login/widgets/name_row.dart';
import 'package:petcare_app/src/features/login/widgets/sign_up_widget.dart';
import '../../../core/app_constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: width(context, 1),
      height: height(context, 1),
      child: Stack(children: [
        Lottie.asset('assets/animation/background.json',
            width: width(context, 1),
            height: height(context, 1),
            fit: BoxFit.cover),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLogin = true;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          color:
                              isLogin ? AppColors.primary2 : AppColors.white),
                      child: Center(
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: isLogin
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLogin = false;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color:
                              isLogin ? AppColors.white : AppColors.primary2),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: isLogin
                                      ? AppColors.black
                                      : AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              isLogin ? const LoginWidget() : const SignUpWidget(),
              const SizedBox(height: 20),
              isLogin
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = false;
                        });
                      },
                      child: Text("Don't have an account? Sign Up",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 12,
                                  )),
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = true;
                        });
                      },
                      child: Text("Alreadyhave an account? Log In",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 12,
                                  )),
                    ),
            ],
          ),
        )
      ]),
    ));
  }
}
