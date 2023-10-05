import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutUsUI extends StatelessWidget {
  const AboutUsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                 style: Theme.of(context)
                     .textTheme
                     .bodyMedium
                     ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),)
            ),
          ),
        ));
  }
}
