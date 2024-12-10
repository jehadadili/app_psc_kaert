import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/validator/validater.dart';
import 'package:market/src/core/widget/custom_text_field_widgets.dart';

class SecureTextField extends StatefulWidget {
  const SecureTextField({
    super.key,
    required this.passwordController,
  });
  final TextEditingController passwordController;
  @override
  State<SecureTextField> createState() => _SecureTextFieldState();
}

class _SecureTextFieldState extends State<SecureTextField> {
  bool isVisible = true;
  bool isVisiblec = true;
  @override
  void initState() {
    super.initState();
    isVisible = false;
    isVisiblec = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWidgets(
          obscureText: !isVisible,
          hintText: StringApp.labelPassword,
          labelText: StringApp.hintPassword,
          prefixIcon: const Icon(Icons.lock),
          controller: widget.passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: (password) {
            return MyValidator.passwrdValidator(password);
          },
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: isVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
