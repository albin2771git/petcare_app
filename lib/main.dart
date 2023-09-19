import 'package:flutter/material.dart';
import 'src/features/splash/pages/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffF94C10)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}