import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';

class AuthActionRow extends StatelessWidget {
  const AuthActionRow(
      {super.key, required this.text, required this.textnav, this.onPressed});
  final String text;
  final String textnav;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 20.sp,
              color: ColorApp.black,
              fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              textnav,
              style: TextStyle(
                  color: ColorApp.charcoalBlue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
