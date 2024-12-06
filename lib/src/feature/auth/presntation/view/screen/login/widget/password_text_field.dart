import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/validator/validater.dart';
import 'package:market/src/core/widget/custom_text_field_widgets.dart';

class PassWordTextField extends StatefulWidget {
  const PassWordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PassWordTextField> createState() => _PassWordTextFieldState();
}

class _PassWordTextFieldState extends State<PassWordTextField> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: CustomTextFieldWidgets(
            obscureText: !isVisible,
            labelText: StringApp.labelPassword,
            prefixIcon: const Icon(Icons.lock),
            controller: widget.passwordController,
            hintText: StringApp.hintPassword,
            fillColor: ColorApp.white,
            filled: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (password) {
  return MyValidator.passwrdValidator(password);            },
          ),
        ),
        SizedBox(height: 6.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: FittedBox(
            child: Row(
              children: [
                Checkbox(
                  value: isVisible,
                  onChanged: (value) {
                    isVisible = value!;
                    setState(() {});
                  },
                ),
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        "rememberMe",
                        style: TextStyle(
                          color: ColorApp.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "forgotPassword",
                          style: TextStyle(
                            color: ColorApp.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
