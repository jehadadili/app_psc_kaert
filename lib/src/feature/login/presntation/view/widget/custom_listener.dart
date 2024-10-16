import 'package:flutter/material.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/widget/custom_show_snack_bar.dart';
import 'package:market/src/feature/home/presntation/view/screen/home_screen.dart';

import '../../../../register/presntation/cubit/state.dart';

listener(BuildContext context, RegisterState state) {
  if (state is LoginError) {
    if (state.registerModeal.status == "error") {
      showSnackBar(
          color: ColorApp.red,
          text: state.registerModeal.message ?? "error status",
          context: context);
    }
  } else if (state is LoginSuccess) {
    showSnackBar(
        color: ColorApp.green,
        text: "User logged in successfully",
        context: context);
    context.pushReplacement(pushReplacement: const HomeScreen());
  }
}
