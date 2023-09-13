import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app_constants/app_colors.dart';


class CircularLoaderNetworkImage extends StatelessWidget {
  const CircularLoaderNetworkImage(
      {Key? key,
      this.heightInput = 0.2,
      required this.widthInput,
      required this.isToday,
      required this.url})
      : super(key: key);

  final double heightInput;
  final double widthInput;
  final bool isToday;
  final String url;

  @override
  Widget build(BuildContext context) {
    return url == null || url == ''
    ? CircleAvatar(
        backgroundColor: AppColors.greyColor,
        radius: heightInput * 140,
        child: const Center(
          child: Icon(
            Icons.person_rounded,
            color: AppColors.greyColor,
          ),
        ),
      )
    : CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: heightInput * 140,
          backgroundColor: isToday ? AppColors.softBlueColor : Colors.transparent,
          child: CircleAvatar(
            backgroundImage: imageProvider,
            radius: heightInput * 130,
          ),
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          radius: heightInput * 140,
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
      );
  }
}
double width(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

double height(BuildContext context, double size) {
  return MediaQuery.of(context).size.height * size;
}



// String dateConversion(String date, String format) {
//   var formattedDate;
//   if(date!=""){
//     var temp = DateFormat('dd-MM-yyyy').parse(date);
//     formattedDate = DateFormat(format).format(temp);
//   }
//   return formattedDate;
// }