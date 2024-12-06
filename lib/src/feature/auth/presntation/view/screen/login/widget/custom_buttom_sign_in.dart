import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/widget/auth_action_row.dart';
import 'package:market/src/core/widget/custom_buttom_widget.dart';
import 'package:market/src/feature/auth/presntation/view/screen/register/screen/register_screen.dart';

class CustomButtomSignIn extends StatelessWidget {
  const CustomButtomSignIn({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtomWidget(
            horizontal: 50.w,
            vertical: 10.h,
            text: "Login",
            icon: Icons.login,
            color: ColorApp.red,
            onPressed: onPressed),
        SizedBox(
          height: 20.h,
        ),
        AuthActionRow(
            text: StringApp.loginRow,
            textnav: StringApp.register,
            onPressed: () {
              context.pushReplacement(
                pushReplacement: const RegisterScreen(),
              );
            }),
      ],
    );
  }
}
