import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/utils/common_utils.dart';
import '../../book_apointments/page/book_appointments_ui.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context, 1),
      height: height(context, 1),
      child: ListView(
        children: const[
        //  LocationRowWidget(),
          BookAppointMents()
        ],
      )
    );
  }
}
