import 'package:flutter/material.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/value/value.dart';
import 'package:market/src/feature/auth/presntation/view/screen/login/screen/login_screen.dart';
import 'package:market/src/feature/home/presntation/view/screen/home_screen.dart';
import 'package:market/src/feature/spalsh_screen/widgets/splash_screen_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (mounted) {
          if (getjehad == null) {
            context.pushReplacement(pushReplacement: const LoginScreen());
          } else if (getjehad != null) {
            context.pushReplacement(pushReplacement: const HomeScreen());
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreenWidgets();
  }
}
