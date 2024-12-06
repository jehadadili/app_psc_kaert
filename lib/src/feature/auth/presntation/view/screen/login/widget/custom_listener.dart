import 'package:flutter/material.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/widget/custom_show_snack_bar.dart';
import 'package:market/src/feature/auth/presntation/cubit/state.dart';
import 'package:market/src/feature/home/presntation/view/screen/home_screen.dart';

listener(BuildContext context, AuthState state) {
  if (state is LoginSuccess) {
    if (state.authModeal.status == "success") {
      showSnackBar(
          context: context,
          text: state.authModeal.message ?? "",
          color: ColorApp.green,
          message: state.authModeal.message ?? "");
      context.pushReplacement(pushReplacement: const HomeScreen());
    }
    if (state.authModeal.status == "error") {
      showSnackBar(
          context: context,
          text: state.authModeal.message ?? "",
          color: ColorApp.red,
          message: state.authModeal.message ?? "");
    } else if (state is LoginError) {
      showSnackBar(
          context: context,
          text: state.authModeal.message ?? "",
          color: ColorApp.red,
          message: state.authModeal.message ?? "");
    }
  }
}
