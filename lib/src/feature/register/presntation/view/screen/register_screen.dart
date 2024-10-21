import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/widget/auth_action_row.dart';
import 'package:market/src/core/widget/custom_animation_text.dart';
import 'package:market/src/core/widget/custom_buttom_widget.dart';
import 'package:market/src/core/widget/custom_widget_loading.dart';
import 'package:market/src/feature/login/presntation/view/screen/login_screen.dart';
import 'package:market/src/feature/register/presntation/cubit/cubit.dart';
import 'package:market/src/feature/register/presntation/cubit/state.dart';
import 'package:market/src/feature/register/presntation/view/widgets/custom_colum_text_field.dart';
import 'package:market/src/feature/register/presntation/view/widgets/custom_container_top.dart';
import 'package:market/src/feature/register/presntation/view/widgets/custom_listener_register.dart';
import '../../../../../core/widget/container_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: listener,
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    CustomContainerTop(
                      child: Padding(
                        padding: EdgeInsets.all(25.w),
                        child: Row(
                          children: [
                            const CustomAnimationText(
                              text: 'Register',
                              color: ColorApp.white,
                              fontSize: 30,
                            ),
                            Image.asset(
                              ImageApp.logo,
                              width: 150.w,
                              height: 100.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Form(
                          key: formKey,
                          child: AuthContainer(
                            height: double.infinity,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
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
                                  if (state is RegisterLoading)
                                    CustomWidgetLoading(
                                      color: Colors.blue,
                                      size: 50.sp,
                                    ),
                                  CustomButtomWidget(
                                    text: "Sign In",
                                    icon: Icons.login,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.addUserRegister(
                                          name: userNameController.text,
                                          email: emailController.text,
                                          phone: phoneController.text,
                                          nationalId: idController.text,
                                          gender: gendrController.text,
                                          password: passwordController.text,
                                          token: tokenController.text,
                                        );
                                      }
                                    },
                                  ),
                                  AuthActionRow(
                                    text: StringApp.registerRow,
                                    textnav: StringApp.lOGIN,
                                    onPressed: () {
                                      context.pushReplacement(
                                        pushReplacement: const LoginScreen(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 130.h,
                  left: MediaQuery.of(context).size.width / 2 - 50.w,
                  child: cubit.image == null
                      ? MaterialButton(
                          onPressed: () {
                            cubit.addImage();
                          },
                          child: Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffEFF1F3)),
                            child: Icon(
                              Icons.camera_alt,
                              size: 45.sp,
                            ),
                          ),
                        )
                      : Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(cubit.image!),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
