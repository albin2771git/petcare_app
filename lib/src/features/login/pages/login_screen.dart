import 'package:cuddlecare/src/core/app_constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
final List<bool> _selectedFruits = <bool>[true, false];
   List<Widget> names=[
    const Text('Login'),
    const Text('Register')
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 450,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(14)),
            child: Stack(children: [
               ToggleButtons(
                direction:  Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedFruits.length; i++) {
                      _selectedFruits[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: AppColors.white,
                selectedColor: Colors.white,
                fillColor: AppColors.primary2,
                color: AppColors.white,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedFruits,
                children: names,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             isLogin = true;
              //           });
              //         },
              //         child: Container(
              //           height: 45,
              //           width: width(context, 0.3),
              //           decoration:  BoxDecoration(
              //               color:isLogin? AppColors.primary2:AppColors.white,
              //               border: Border.all(color:isLogin? AppColors.white:AppColors.black,width: 0.3),
              //               borderRadius:const BorderRadius.only(
              //                   topLeft: Radius.circular(14),
              //                   bottomLeft: Radius.circular(14))),
              //           child: Center(
              //             child:  Text(
              //                 'Login',
              //                 style: TextStyle(
              //                     color:isLogin? AppColors.white:AppColors.black,
              //                     fontSize: 18,
              //                     fontWeight: FontWeight.w600),
              //               ),   
              //           ),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: (){
              //           setState(() {
              //             isLogin = false;
              //           });
              //         },
              //         child: Container(
              //             height: 45,
              //             width: width(context, 0.3),
              //             decoration:  BoxDecoration(
              //                 color:isLogin? AppColors.white:AppColors.primary2,
              //                  border: Border.all(color:isLogin? AppColors.black:AppColors.white,width: 0.3),
              //                 borderRadius:const BorderRadius.only(
              //                     topRight: Radius.circular(14),
              //                     bottomRight: Radius.circular(14))),
              //             child: Center(
              //               child:   Text(
              //                   'Register',
              //                   style: TextStyle(
              //                       color:isLogin?AppColors.black: AppColors.white,
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.w600),
              //                 ),
              //             )),
              //       ),
              //     ],
              //   ),
              // )
            ]),
          ),
        ));
  }
}
