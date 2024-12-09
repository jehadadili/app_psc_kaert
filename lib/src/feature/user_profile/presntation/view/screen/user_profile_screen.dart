import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/cubit.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/state.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_personal_information.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_utilities.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<ProfileCubit>()..profiledata(),
      child: Scaffold(
        backgroundColor: ColorApp.bluedark,
        appBar: AppBar(
          backgroundColor: ColorApp.bluedark,
          elevation: 0,
          iconTheme: const IconThemeData(color: ColorApp.white),
        ),
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomPersonalInformation(
                        authModeal: state.authModeal,
                      ),
                      const CustomUtilities()
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
}
