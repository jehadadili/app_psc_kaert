import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProductCart extends StatelessWidget {
  const ImageProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      child: Image.network(
        "https://res.cloudinary.com/dzh2hde2n/image/upload/v1684434230/hsincqjvphkmfbrcoc2b.png",
        width: 230.w,
        height: 200.h,
      ),
    );
  }
}
