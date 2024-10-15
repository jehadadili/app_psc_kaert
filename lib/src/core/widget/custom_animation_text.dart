import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnimationText extends StatelessWidget {
  const CustomAnimationText(
      {super.key, this.color, required this.fontSize, required this.text});
  final Color? color;
  final double fontSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize.sp,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
