import 'package:flutter/material.dart';
import 'package:petcare_app/src/features/login/pages/login_screen.dart';
import 'package:petcare_app/src/features/login/presentation/login_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: const LoginScreen(),
    );
  }
}
