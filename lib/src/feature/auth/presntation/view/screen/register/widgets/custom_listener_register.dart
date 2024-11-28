import 'package:flutter/material.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/widget/custom_show_snack_bar.dart';
import 'package:market/src/feature/auth/presntation/cubit/state.dart';
import 'package:market/src/feature/profile/presntation/view/screen/profile_screen.dart';

listener(BuildContext context, AuthState state) {
  if (state is RegisterSuccess) {
    context.pushReplacement(
      pushReplacement: const ProfileScreen(),
    );
  } else if (state is RegisterError) {
    final registerModel = state.registerModeal;

    if (registerModel.status == "error") {
      showSnackBar(
        context: context,
        message:
            registerModel.message ?? "حدث خطأ أثناء التسجيل. حاول مرة أخرى.",
        color: Colors.red,
        text: state.registerModeal.message ?? "error status",
      );
    }
  }
}
