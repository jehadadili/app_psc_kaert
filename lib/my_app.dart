import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/feature/home/presntation/view/screen/home_screen.dart';
import 'package:market/src/feature/register/presntation/cubit/cubit.dart';
import 'package:market/src/feature/spalsh_screen/screen/splash_screen.dart';


class AppShop extends StatelessWidget {
  const AppShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(360, 690),
      
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => sl.get<RegisterCubit>() ,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}

