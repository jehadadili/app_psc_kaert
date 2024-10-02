import 'package:flutter/material.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/feature/register/presntation/view/spalsh_screen/widgets/splash_screen_widgets.dart';

import '../../auth/sign_in/screen/sign_in_screen.dart';

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
          context.pushReplacement(pushReplacement: const SignInScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreenWidgets();
  }
}
