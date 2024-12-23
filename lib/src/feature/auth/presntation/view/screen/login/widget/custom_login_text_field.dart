import 'package:flutter/material.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/validator/validater.dart';
import 'package:market/src/core/widget/custom_text_field_widgets.dart';
import 'package:market/src/feature/auth/presntation/view/screen/login/widget/password_text_field.dart';

class CustomLoginTextField extends StatelessWidget {
  const CustomLoginTextField(
      {super.key,
      required this.emailController,
      required this.passwordController});
  final TextEditingController emailController;

  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWidgets(
          hintText: StringApp.hintEmail,
          labelText: StringApp.labelEmail,
          prefixIcon: const Icon(Icons.email),
          controller: emailController,
          validator: (email) {
            return MyValidator.emalValidator(email);
          },
          fillColor: ColorApp.white,
          filled: true,
          keyboardType: TextInputType.emailAddress,
        ),
        PassWordTextField(
          passwordController: passwordController,
        )
      ],
    );
  }
}
