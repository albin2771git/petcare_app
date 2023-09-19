import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset("assets/animation/pet2.json")),
          Text(
            "Loading...",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
