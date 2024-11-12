import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          // إعادة استخدام الـ ShimmerItem بدلاً من بناء عنصر جديد لكل عنصر
          return ShimmerItem(); // إزالة const هنا للمحافظة على إعادة الاستخدام
        },
      ),
    );
  }
}

class ShimmerItem extends StatelessWidget {
  ShimmerItem({super.key});

  final _baseColor = Colors.blue[100]!;
  final _highlightColor = Colors.grey[100]!;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              color: Colors.white,
            ),
            SizedBox(width: 8.0.w), // استخدام .w للتحكم الدقيق في المسافات
            const Expanded(
              child: ShimmerContent(),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerContent extends StatelessWidget {
  const ShimmerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // استخدام ClipRRect لتقليل الحمل على العناصر
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: double.infinity,
            height: 8.h,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.h), // استخدام .h لضبط المسافات
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: double.infinity,
            height: 8.h,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: 100.w,
            height: 8.h,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
