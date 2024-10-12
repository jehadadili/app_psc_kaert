import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/widget/custom_show_snack_bar.dart';
import 'package:market/src/feature/login/presntation/view/widget/custom_login_text_field.dart';
import 'package:market/src/feature/register/presntation/cubit/cubit.dart';
import 'package:market/src/feature/register/presntation/cubit/state.dart';
import 'package:market/src/feature/register/presntation/view/screen/register_screen.dart';

import '../../../../../core/widget/auth_action_row.dart';
import '../../../../../core/widget/container_widgets.dart';
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          if (state.registerModeal.status == "error") {
            showSnackBar(
                color: ColorApp.red,
                text: state.registerModeal.message ?? "error status",
                context: context);
          }
          if (state.registerModeal.status == "success") {
            showSnackBar(
                color: ColorApp.green,
                text: state.registerModeal.message ?? "success status",
                context: context);
          }
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: BackgroundImageContainer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Image.asset(
                    ImageApp.logo,
                    width: 150.w,
                    height: 130.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: formKey,
                      child: AuthContainer(
                        height: 400.h,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            // AnimatedTextKit(
                            //   repeatForever: true,
                            //   animatedTexts: [
                            //     TypewriterAnimatedText(
                            //       'Login',
                            //       textStyle: TextStyle(
                            //         fontSize: 40.sp,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //       speed: const Duration(milliseconds: 200),
                            //     ),
                            //   ],
                            // ),
                            CustomLoginTextField(
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButtomWidget(
                              text: "Login",
                              icon: Icons.login,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.logincubit(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            // Spacer here to create flexible space
                            // This will take up any available space
                            AuthActionRow(
                              text: StringApp.loginRow,
                              textnav: StringApp.register,
                              onPressed: () {
                                context.pushReplacement(
                                  pushReplacement: const RegisterScreen(),
                                );
                              },
                            ),
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
      },
    );
  }
}
