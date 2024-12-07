import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUtilities extends StatelessWidget {
  const CustomUtilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           _buildSectionTitle("Utilities", null),
                      SizedBox(height: 10.h),
                      _buildUtilityTile(
                        Icons.logout,
                        "Log-Out",
                      ),
      ],
    );
  }
}

  Widget _buildSectionTitle(String title, IconData? icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (icon != null)
          Icon(
            icon,
            color: Colors.blue,
            size: 20.sp,
          ),
      ],
    );
  }

  Widget _buildUtilityTile(IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        // أضف هنا الحدث عند الضغط
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E3E),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.pinkAccent,
              size: 24.sp,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
