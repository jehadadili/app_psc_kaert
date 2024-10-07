import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/feature/login/presntation/view/widget/custom_login_text_field.dart';
import 'package:market/src/feature/register/presntation/view/screen/register_screen.dart';

import '../../../../../core/style/color/color_app.dart';
import '../../../../../core/widget/auth_action_row.dart';
import '../../../../../core/widget/custom_buttom_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();

    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.auth),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Image.asset(
                ImageApp.logo,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: formKey,
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: ColorApp.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Login',
                              textStyle: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                        ),
                        CustomLoginTextField(
                            emailController: emailController,
                            passwordController: passwordController),
                        CustomButtomWidget(
                          text: "Login",
                          icon: Icons.login,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        AuthActionRow(
                          text: "Create a new account?",
                          textnav: "Register",
                          onPressed: () {
                            context.pushReplacement(
                              pushReplacement: const RegisterScreen(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
