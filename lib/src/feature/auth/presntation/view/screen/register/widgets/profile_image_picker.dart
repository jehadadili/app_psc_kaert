import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class ProfileImagePicker extends StatelessWidget {
  final File? image; 
  final VoidCallback onPickImage;

  const ProfileImagePicker({
    super.key,
    required this.image,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 130.h,
      left: MediaQuery.of(context).size.width / 2 - 50.w,
      child: image == null
          ? MaterialButton(
              onPressed: onPickImage,
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffEFF1F3),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 45.sp,
                ),
              ),
            )
          : Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
