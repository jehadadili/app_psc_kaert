import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';
import 'package:market/src/feature/favorite/presntion/cubit/cubit.dart';
import 'package:market/src/feature/auth/presntation/cubit/cubit.dart';
import 'package:market/src/feature/home/presntation/view/screen/home_screen.dart';
import 'package:market/src/feature/search/cubit/cubit.dart';

class AppShop extends StatelessWidget {
  const AppShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl.get<AuthCubit>(),
            ),
            BlocProvider(
              create: (context) => FavoriteCubit(),
            ),
            BlocProvider(
              create: (context) => SearchCubit(),
            ),
            BlocProvider(
              create: (context) => sl.get<CartCubit>(),
            ),
          ],
          child: MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}
