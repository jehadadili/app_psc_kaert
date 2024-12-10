import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/cubit.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/state.dart';

class CustomUserDrawer extends StatelessWidget {
  const CustomUserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const CircularProgressIndicator();
        } else if (state is ProfileSuccess) {
          return Column(
            children: [
              SizedBox(
                height: 20.w,
              ),
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.pinkAccent,
                child: CircleAvatar(
                  radius: 48.r,
                  backgroundImage:
                      NetworkImage(state.authModeal.user?.profileImage),
                ),
              ),
              Text(
                state.authModeal.user?.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        } else if (state is ProfileFilyer) {
          return Center(
            child: Text(
              state.mass,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
