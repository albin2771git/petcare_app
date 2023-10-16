import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/utils/common_utils.dart';

class BookAppointMents extends StatelessWidget {
  const BookAppointMents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width(context, 1),
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.blueAccent,
              Colors.blue.shade400,
              Colors.lightBlueAccent,
              Colors.lightBlue,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             // SizedBox(child: Image.asset("assets/icons/appointment.png"))
            ],
          ),
        ),
      ),
    );
  }
}
