import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_colors.dart';
import '../widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: const Text("HomeScreen"),
        ),
        drawer:const HomeDrawer());
  }
}
