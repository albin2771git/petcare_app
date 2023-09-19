import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare_app/src/core/utils/common_utils.dart';
import 'package:petcare_app/src/features/home/pages/home_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/common_widgets/common_button.dart';
import '../../../core/common_widgets/common_loading.dart';
import '../../../core/common_widgets/common_textfield.dart';
import '../../../core/common_widgets/toast.dart';
import '../presentation/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  bool isLogin = true;
  bool viewpassword = true;
  bool conformPassword = true;

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = context.watch<LoginProvider>();
    return Scaffold(
        body: SizedBox(
      width: width(context, 1),
      height: height(context, 1),
      child: provider.isLoading
          ? const CommonLoading()
          : Stack(children: [
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
                                color: isLogin
                                    ? AppColors.primary2
                                    : AppColors.white),
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
                                color: isLogin
                                    ? AppColors.white
                                    : AppColors.primary2),
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
                    isLogin
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonTextFieldWidget(
                                    hintText: "Enter your password",
                                    controller: emailController),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: passwordController,
                                  cursorColor: AppColors.white,
                                  style: const TextStyle(
                                      color: AppColors.white, fontSize: 14),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: "Enter your password",
                                    hintStyle: const TextStyle(
                                        fontSize: 12, color: AppColors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (viewpassword) {
                                              viewpassword = false;
                                            } else {
                                              viewpassword = true;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          viewpassword == true
                                              ? Icons.remove_red_eye
                                              : Icons.visibility_off,
                                          color: AppColors.white,
                                        )),
                                  ),
                                  obscureText: viewpassword,
                                  obscuringCharacter: "*",
                                ),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        onPressed: () async {
                                          if (emailController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              passwordController.text
                                                  .trim()
                                                  .isNotEmpty) {
                                            dynamic body = {
                                              "username":
                                                  emailController.text.trim(),
                                              "password":
                                                  passwordController.text.trim()
                                            };
                                            var bodyData = jsonEncode(body);
                                            bool isLoginSuccess = await provider
                                                .login(context, bodyData);
                                            if (isLoginSuccess) {
                                              if (context.mounted) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomeScreen()));
                                              }
                                            }
                                          } else {
                                            CommonCreateFunction
                                                .uploadFailFunction(
                                                    context,
                                                    AppStrings
                                                        .enterValidValues);
                                          }
                                        },
                                      )
                                    ]),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonTextFieldWidget(
                                    hintText: "Enter your name",
                                    controller: nameController),
                                const SizedBox(height: 20),
                                CommonTextFieldWidget(
                                    hintText: "Enter your mobile number",
                                    controller: numberController),
                                const SizedBox(height: 20),
                                CommonTextFieldWidget(
                                    hintText: "Enter your email",
                                    controller: signUpEmailController),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: signUpPasswordController,
                                  cursorColor: AppColors.white,
                                  style: const TextStyle(
                                      color: AppColors.white, fontSize: 14),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: "Enter your password",
                                    hintStyle: const TextStyle(
                                        fontSize: 12, color: AppColors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (viewpassword) {
                                              viewpassword = false;
                                            } else {
                                              viewpassword = true;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          viewpassword == true
                                              ? Icons.remove_red_eye
                                              : Icons.visibility_off,
                                          color: AppColors.white,
                                        )),
                                  ),
                                  obscureText: viewpassword,
                                  obscuringCharacter: "*",
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: passwordAgainController,
                                  cursorColor: AppColors.white,
                                  style: const TextStyle(
                                      color: AppColors.white, fontSize: 14),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: "Enter your password Again",
                                    hintStyle: const TextStyle(
                                        fontSize: 12, color: AppColors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (conformPassword) {
                                              conformPassword = false;
                                            } else {
                                              conformPassword = true;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          conformPassword == true
                                              ? Icons.remove_red_eye
                                              : Icons.visibility_off,
                                          color: AppColors.white,
                                        )),
                                  ),
                                  obscureText: conformPassword,
                                  obscuringCharacter: "*",
                                ),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CommonButtonWidget(
                                        width: 90,
                                        height: 32,
                                        color: AppColors.primary2,
                                        radius: 12,
                                        textColor: AppColors.white,
                                        text: "Cancel",
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      CommonButtonWidget(
                                        width: 90,
                                        height: 32,
                                        color: AppColors.primary2,
                                        radius: 12,
                                        textColor: AppColors.white,
                                        text: "Sign Up",
                                        onPressed: () async {
                                          if (nameController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              numberController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              signUpEmailController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              signUpPasswordController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              passwordAgainController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              signUpPasswordController.text
                                                      .trim() ==
                                                  passwordAgainController.text
                                                      .trim()) {
                                            dynamic body = {
                                              "name":
                                                  nameController.text.trim(),
                                              "phoneNumber":
                                                  numberController.text.trim(),
                                              "username": signUpEmailController
                                                  .text
                                                  .trim(),
                                              "password":
                                                  signUpPasswordController.text
                                                      .trim(),
                                              "profilePicture": ""
                                            };
                                            var bodyData = jsonEncode(body);
                                            bool isSignUpSuccess =
                                                await provider.register(
                                                    context, bodyData);
                                            if (isSignUpSuccess) {
                                              if (context.mounted) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomeScreen()));
                                              }
                                            }
                                          } else {
                                            CommonCreateFunction
                                                .uploadFailFunction(
                                                    context,
                                                    AppStrings
                                                        .signUpFailedCheck);
                                          }
                                        },
                                      )
                                    ]),
                              ],
                            ),
                          ),
                    const SizedBox(height: 20),
                    isLogin
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                isLogin = false;
                              });
                            },
                            child: Text("Don't have an account? Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
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
