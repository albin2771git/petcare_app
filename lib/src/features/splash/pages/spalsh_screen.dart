
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petcare_app/src/features/login/pages/login_screen.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/utils/common_utils.dart';
import '../../login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width(context, 1),
              child: Image.asset(
                'assets/images/logo5.png',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child:const Login(),
                                    type: PageTransitionType.bottomToTop));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black.withOpacity(0.6),
                          ))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
