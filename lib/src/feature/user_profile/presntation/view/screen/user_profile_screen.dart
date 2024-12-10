import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/cubit.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/state.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_personal_information.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_utilities.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.bluedark,
      appBar: AppBar(
        backgroundColor: ColorApp.bluedark,
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorApp.white),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFilyer) {
            return Center(child: Text(state.mass)); // إظهار رسالة الخطأ
          }
          if (state is ProfileLoading) {
            return const Center(
                child: CircularProgressIndicator()); // عرض مؤشر التحميل
          }
          if (state is ProfileSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomPersonalInformation(
                        authModeal: state.authModeal), // عرض بيانات المستخدم
                    const CustomUtilities() // إضافة الأدوات المساعدة الأخرى
                  ],
                ),
              ),
            );
          } else {
            return const Center(
                child: Text("State has an error")); // حالة غير محددة
          }
        },
      ),
    );
  }
}
