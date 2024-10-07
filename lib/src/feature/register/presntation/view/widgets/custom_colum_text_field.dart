import 'package:flutter/material.dart';
import 'package:market/src/core/style/string_app/string_app.dart';
import 'package:market/src/core/validator/validater.dart';
import 'package:market/src/core/widget/custom_text_field_widgets.dart';

class CustomColumTextField extends StatelessWidget {
  const CustomColumTextField(
      {super.key,
      required this.userNameController,
      required this.emailController,
      required this.phoneController,
      required this.idController,
      required this.passwordController,
      required this.gendrController,
      required this.tokenController});
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController idController;
  final TextEditingController passwordController;
  final TextEditingController gendrController;
  final TextEditingController tokenController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWidgets(
          hintText: StringApp.labelName,
          labelText: StringApp.hintEmail,
          prefixIcon: const Icon(Icons.person),
          controller: userNameController,
          validator: (name) {
            return MyValidator.nameValidator(name);
          },
        ),
        CustomTextFieldWidgets(
          hintText: StringApp.labelEmail,
          labelText: StringApp.hintEmail,
          prefixIcon: const Icon(Icons.email),
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (email) {
            return MyValidator.emalValidator(email);
          },
        ),
        CustomTextFieldWidgets(
          hintText: StringApp.labelPhone,
          labelText: StringApp.hintPhone,
          prefixIcon: const Icon(Icons.phone),
          controller: phoneController,
          keyboardType: TextInputType.phone,
          validator: (phone) {
            return MyValidator.phoneValidator(phone);
          },
        ),
        CustomTextFieldWidgets(
          hintText: StringApp.labelIdNumber,
          labelText: StringApp.labelName,
          prefixIcon: const Icon(Icons.insert_drive_file),
          controller: idController,
          keyboardType: TextInputType.number,
          validator: (id) {
            return MyValidator.idValidator(id);
          },
        ),
        CustomTextFieldWidgets(
          hintText: StringApp.labelGender,
          labelText: StringApp.hintGender,
          prefixIcon: const Icon(Icons.female),
          controller: gendrController,
          keyboardType: TextInputType.text,
          validator: (gendr) {
            return MyValidator.gendrValidator(gendr);
          },
        ),
        CustomTextFieldWidgets(
          hintText: StringApp.labelPassword,
          labelText: StringApp.hintPassword,
          prefixIcon: const Icon(Icons.lock),
          controller: passwordController,
          keyboardType: TextInputType.text,
          validator: (password) {
            return MyValidator.passwrdValidator(password);
          },
        ),
        CustomTextFieldWidgets(
          hintText: StringApp.labelToken,
          labelText: StringApp.hintToken,
          prefixIcon: const Icon(Icons.token),
          controller: tokenController,
          keyboardType: TextInputType.text,
          validator: (token) {
            return MyValidator.tokenValidator(token);
          },
        ),
      ],
    );
  }
}
