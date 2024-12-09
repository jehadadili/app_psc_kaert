import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserDrawer extends StatelessWidget {
  const CustomUserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.w,
        ),
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.pinkAccent,
          child: CircleAvatar(
            radius: 48.r,
            backgroundImage: const NetworkImage(
                "https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI="),
          ),
        ),
        Text(
          "Jehad adili",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
