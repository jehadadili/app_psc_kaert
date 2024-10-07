import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/core/widget/auth_action_row.dart';
import 'package:market/src/core/widget/custom_buttom_widget.dart';
import 'package:market/src/feature/login/presntation/view/screen/login_screen.dart';
import 'package:market/src/feature/register/presntation/view/widgets/custom_colum_text_field.dart';

import '../../../../../core/style/color/color_app.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController gendrController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    idController.dispose();
    gendrController.dispose();
    passwordController.dispose();
    tokenController.dispose();
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
                height: 55.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: formKey,
                  child: Container(
                    width: double.infinity,
                    height: 630.h,
                    decoration: BoxDecoration(
                      color: ColorApp.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Register',
                              textStyle: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                        ),
                        CustomColumTextField(
                          userNameController: userNameController,
                          passwordController: passwordController,
                          phoneController: phoneController,
                          gendrController: gendrController,
                          tokenController: tokenController,
                          emailController: emailController,
                          idController: idController,
                        ),
                        CustomButtomWidget(
                          text: "Sign In",
                          icon: Icons.login,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                        ),
                        AuthActionRow(
                          text: "Already have an account?",
                          textnav: "Login",
                          onPressed: () {
                            context.pushReplacement(
                              pushReplacement: const LoginScreen(),
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
