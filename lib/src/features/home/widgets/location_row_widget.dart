

import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_colors.dart';

class LocationRowWidget extends StatelessWidget {
  const LocationRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         const Icon(Icons.location_on,color: AppColors.primary2,size: 30,),
         Text("Kochi",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18,fontWeight: FontWeight.bold),),
        const Spacer(),
         Icon(Icons.notifications,color: Theme.of(context).iconTheme.color,size: 30,)
        ],
      ),
    );
  }
}