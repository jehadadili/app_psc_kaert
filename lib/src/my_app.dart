import 'package:flutter/material.dart';
import 'package:market/src/feature/register/presntation/view/spalsh_screen/screen/splash_screen.dart';

class AppShop extends StatelessWidget {
  const AppShop({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}