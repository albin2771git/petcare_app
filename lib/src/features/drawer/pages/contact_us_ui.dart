import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/common_widgets/common_back_button.dart';
import '../../../core/utils/common_utils.dart';

class ContactUsUI extends StatelessWidget {
  const ContactUsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CommonBackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "Let's Connect with us!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 34, fontWeight: FontWeight.w600),
                )
                    .animate()
                    .fade(duration: const Duration(milliseconds: 1000))
                    .move(curve: Curves.linear),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  rowWidget(context, "assets/icons/github.png", "albin2771git",
                      () {}),
                  rowWidget(
                      context, "assets/icons/threads.png", "58,456,848", () {}),
                  rowWidget(context, "assets/icons/instagram.png", "_me_albin",
                      () {}),
                  rowWidget(context, "assets/icons/whatsapp_logo.png",
                      "Albin Thomas", () {}),
                  rowWidget(context, "assets/icons/facebook.png",
                      "Albin Thomas", () {}),
                  rowWidget(context, "assets/icons/telephone-call.png", "Call",
                      () {}),
                ],
              ).animate().fade(duration: const Duration(milliseconds: 1200))
            ],
          ),
        ));
  }

  Widget rowWidget(
      BuildContext context, String assetImg, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
              height: height(context, 0.10),
              width: width(context, 0.10),
              child: Image.asset(assetImg)),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
