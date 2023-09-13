// import 'package:flutter/material.dart';
// import '../../../core/app_constants/app_colors.dart';

// class NameRow extends StatefulWidget {
//    NameRow({super.key});

//   @override
//   State<NameRow> createState() => _NameRowState();
// }

// class _NameRowState extends State<NameRow> {
// int tabIndex=0;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         InkWell(
//           onTap: (){
//             setState(() {
//               tabIndex=0;
     
//             });
//           },
//           child: Container(
//             width: 90,
//             height: 32,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color:tabIndex==0? AppColors.primary2:AppColors.white),
//             child: Center(
//               child: Text(
//                 "Login",
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color:tabIndex==9? AppColors.white:AppColors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         InkWell(
//           onTap: (){
//             setState(() {
//               tabIndex=1;
//             });
//           },
//           child: Container(
//             width: 90,
//             height: 32,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color:tabIndex==1? AppColors.primary2:AppColors.white),
//             child: Center(
//               child: Text(
//                 "Sign Up",
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color:tabIndex==0? AppColors.white:AppColors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
