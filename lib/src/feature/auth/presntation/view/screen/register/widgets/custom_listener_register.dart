import 'package:flutter/material.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/widget/custom_show_snack_bar.dart';
import 'package:market/src/feature/home/presntation/view/screen/home_screen.dart';
import 'package:market/src/feature/auth/presntation/cubit/state.dart';
listener(BuildContext context, AuthState state) {
  if (state is RegisterSuccess) {
    // في حالة النجاح يتم الانتقال إلى الصفحة الرئيسية
    context.pushReplacement(
      pushReplacement: const HomeScreen(),
    );
  } else if (state is RegisterError) {
    // عرض رسالة خطأ عند حدوث مشكلة أثناء التسجيل
    final registerModel = state.registerModeal;

    if (registerModel.status == "error") {
      showSnackBar(
        context: context,
        message: registerModel.message ?? "حدث خطأ أثناء التسجيل. حاول مرة أخرى.",
        color: Colors.red, 
       text: state.registerModeal.message ?? "error status",
      );
    }
  }
}
