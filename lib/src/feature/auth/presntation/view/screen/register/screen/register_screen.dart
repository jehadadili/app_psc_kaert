import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/helper/cashe_helper.dart';

import 'package:market/src/core/value/value.dart';

import 'package:market/src/core/widget/custom_widget_loading.dart';
import 'package:market/src/feature/auth/presntation/cubit/cubit.dart';
import 'package:market/src/feature/auth/presntation/cubit/state.dart';
import 'package:market/src/feature/auth/presntation/view/screen/register/widgets/custom_buttom_register.dart';
import 'package:market/src/feature/auth/presntation/view/screen/register/widgets/profile_image_picker.dart';
import 'package:market/src/feature/auth/presntation/view/screen/register/widgets/custom_colum_text_field.dart';
import 'package:market/src/feature/auth/presntation/view/screen/register/widgets/custom_container_top.dart';
import 'package:market/src/feature/auth/presntation/view/screen/register/widgets/custom_listener_register.dart';
import '../../../../../../../core/widget/container_widgets.dart';

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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: listener,
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  const CustomContainerTop(),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
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
                                  CustomButtomRegister(
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
                                        FocusScope.of(context).unfocus();
                                      }
                                      CasheHelper.saveData(
                                          key: keyauthid,
                                          value: idController.text);
                                      CasheHelper.saveData(
                                          key: keytoken,
                                          value: tokenController.text);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ProfileImagePicker(
                image: cubit.image,
                onPickImage: () {
                  cubit.addImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
