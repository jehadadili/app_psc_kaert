import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/string/string_app.dart';
import 'package:market/src/core/widget/auth_action_row.dart';
import 'package:market/src/core/widget/custom_buttom_widget.dart';
import 'package:market/src/feature/auth/presntation/view/screen/login/screen/login_screen.dart';

class CustomButtomRegister extends StatelessWidget {
  const CustomButtomRegister({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtomWidget(
            vertical: 10.h,
            horizontal: 50.w,
            color: ColorApp.red,
            text: "Sign In",
            icon: Icons.login,
            onPressed: onPressed),
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
    );
  }
}
