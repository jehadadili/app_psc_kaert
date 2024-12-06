import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/cubit.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/state.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_personal_information.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<ProfileCubit>()..profiledata(),
      child: Scaffold(
        backgroundColor: const Color(0xFF0D0D2B),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileFilyer) {
              return Text(state.mass);
            }
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomPersonalInformation(
                        authModeal: state.authModeal,
                      ),
                      _buildSectionTitle("Utilities", null),
                      SizedBox(height: 10.h),
                      _buildUtilityTile(
                        Icons.logout,
                        "Log-Out",
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text("state has error");
            }
          },
        ),
      ),
    );
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
}
