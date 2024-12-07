import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_detils_profilei.dart';
import 'package:intl/intl.dart'; // مكتبة لعرض التاريخ

class CustomPersonalInformation extends StatelessWidget {
  const CustomPersonalInformation({super.key, required this.authModeal});
  final AuthModeal authModeal;

  @override
  Widget build(BuildContext context) {
    final String currentDate =
        DateFormat('EEEE, dd MMM, yyyy').format(DateTime.now());

    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.pinkAccent,
            child: CircleAvatar(
              radius: 48.r,
              backgroundImage: NetworkImage(authModeal.user?.profileImage),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        // اسم المستخدم
        Text(
          authModeal.user?.name ?? "User Name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        // التاريخ الحالي
        Text(
          currentDate,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 30.h),
        // المعلومات الشخصية
        _buildSectionTitle("Personal Information", Icons.edit),
        SizedBox(height: 10.h),
        CustomDetilsProfilei(
          icon: Icons.person,
          title: "Name",
          value: authModeal.user?.name ?? "Unknown",
        ),
        CustomDetilsProfilei(
          icon: Icons.email,
          title: "Email",
          value: authModeal.user?.email ?? "",
        ),
        CustomDetilsProfilei(
          icon: Icons.phone,
          title: "Phone",
          value: authModeal.user?.phone ?? "",
        ),
        CustomDetilsProfilei(
          icon: Icons.insert_drive_file,
          title: "National ID",
          value: authModeal.user?.nationalId ?? "",
        ),
        CustomDetilsProfilei(
          icon: Icons.insert_drive_file,
          title: "Gender",
          value: authModeal.user?.gender ?? "",
        ),
        SizedBox(height: 30.h),
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
