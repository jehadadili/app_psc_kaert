import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/profile/presntation/cubit/cubit.dart';
import 'package:market/src/feature/profile/presntation/cubit/state.dart';
import 'package:market/src/feature/profile/presntation/view/widgets/custom_detils_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<ProfileCubit>()..profiledata(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile Edit',
            style: TextStyle(
              color: ColorApp.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: ColorApp.white),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body:
            BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
          if (state is ProfileFilyer) {
            return Text(state.mass);
          }
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileSuccess) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDetailsProfile(
                        authModeal: state.authModeal,
                      )
                    ]));
          } else {
            return const Text("state has error");
          }
        }),
      ),
    );
  }
}
