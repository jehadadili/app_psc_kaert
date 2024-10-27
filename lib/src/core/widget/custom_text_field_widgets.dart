import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/widget/custom_border.dart';

class CustomTextFieldWidgets extends StatelessWidget {
  const CustomTextFieldWidgets({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.validator,
    this.controller,
    this.keyboardType,
    this.filled,
    this.fillColor,
    this.enabled, // إضافة هذا المتغير
  });

  final String hintText;
  final String labelText;
  final Widget prefixIcon;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? filled;
  final Color? fillColor;
  final bool? enabled; // المتغير الجديد للتحكم في التفعيل/التعطيل

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(color: ColorApp.black),
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        enabled: enabled, // تفعيل/تعطيل الحقل بناءً على المتغير
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: filled,
          enabledBorder: CustomBorder.defaultBorder(),
          focusedBorder: CustomBorder.defaultBorder(
              color: ColorApp.green, width: 1, radius: 15),
          errorBorder: CustomBorder.defaultBorder(
            color: ColorApp.red,
            width: 1,
            radius: 5,
          ),
          focusedErrorBorder: CustomBorder.defaultBorder(
            color: ColorApp.red,
            width: 1,
            radius: 5,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: ColorApp.black,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorApp.black,
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
