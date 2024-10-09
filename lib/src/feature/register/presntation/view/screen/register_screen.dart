import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/widget/auth_action_row.dart';
import 'package:market/src/core/widget/custom_buttom_widget.dart';
import 'package:market/src/core/widget/custom_show_snack_bar.dart';
import 'package:market/src/feature/login/presntation/view/screen/login_screen.dart';
import 'package:market/src/feature/register/presntation/cubit/cubit.dart';
import 'package:market/src/feature/register/presntation/cubit/state.dart';
import 'package:market/src/feature/register/presntation/view/widgets/custom_colum_text_field.dart';
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
        RegisterCubit cubit = RegisterCubit.get(context);
        return Scaffold(
          body: BackgroundImageContainer(
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
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
                              // AnimatedTextKit(
                              //   repeatForever: true,
                              //   animatedTexts: [
                              //     TypewriterAnimatedText(
                              //       'Register',
                              //       textStyle: TextStyle(
                              //         fontSize: 25.sp,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //       speed: const Duration(milliseconds: 200),
                              //     ),
                              //   ],
                              // ),
                              cubit.image == null
                                  ? MaterialButton(
                                      onPressed: () {
                                        cubit.addImage();
                                      },
                                      child: Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3URjWpcZfPfzAHxrU_Xms2GzfUJmvWXGjuw&s",
                                            ),
                                          ),
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

                              CustomColumTextField(
                                userNameController: userNameController,
                                passwordController: passwordController,
                                phoneController: phoneController,
                                gendrController: gendrController,
                                tokenController: tokenController,
                                emailController: emailController,
                                idController: idController,
                              ),
                              SizedBox(
                                height: 20.h,
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
                                        token: tokenController.text);
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20.h,
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
          ),
        );
      },
    );
  }
}
