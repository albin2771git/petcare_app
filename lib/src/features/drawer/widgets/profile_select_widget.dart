import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/app_constants/app_colors.dart';

class ProfileSelectWidget extends StatefulWidget {
  const ProfileSelectWidget({super.key});

  @override
  State<ProfileSelectWidget> createState() => _ProfileSelectWidgetState();
}

class _ProfileSelectWidgetState extends State<ProfileSelectWidget> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          selectedImage == null
              ? const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    'assets/images/person.jpg',
                  ))
              : Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(selectedImage!, fit: BoxFit.cover)),
                ),
          Positioned(
            bottom: 0,
            right: 13,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    //----- show bottom sheet
                    selectSheet(context);
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
                    size: 20,
                    color: AppColors.primary2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //----------------- bottom sheet
  void selectSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  leading:
                      const Icon(Icons.camera_alt, color: AppColors.primary2),
                  title: const Text('Camera'),
                  onTap: () {
                    pickImageCamera();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_album,
                    color: AppColors.primary2,
                  ),
                  title: const Text('Gallery'),
                  onTap: () {
                    pickImageGallery();
                  },
                ),
              ],
            ),
          );
        });
  }

  //-------- pick image from gallery
  Future pickImageGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;

    setState(() {
      selectedImage = File(returnedImage.path);
    });
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  //----------------- pick image from camera
  Future pickImageCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
