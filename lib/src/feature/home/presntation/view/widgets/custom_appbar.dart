import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/core/widget/custom_animation_text.dart';
import 'package:market/src/feature/cart/presntation/view/screen/cart_screen.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/search/view/screen/search_screen.dart';

class CustomContainerAppbar extends StatelessWidget {
  const CustomContainerAppbar({super.key, required this.homemodel});
  final List<HomeModel> homemodel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          iconTheme: IconThemeData(color: ColorApp.white, size: 30.sp),
          backgroundColor: ColorApp.bluedark,
          title: CustomAnimationText(
            text: "PCDKART",
            fontSize: 25.sp,
            color: Colors.white,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pushwidget(push: const CartScreen());
              },
              child: Image.asset(
                ImageApp.logo1,
                width: 50.w,
              ),
            ),
            Card(
              elevation: 4,
              color: Colors.white,
              child: IconButton(
                onPressed: () {
                  context.pushwidget(push: SearchScreen(homemodel: homemodel));
                },
                icon: Icon(
                  Icons.search,
                  size: 30.sp,
                  color: ColorApp.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
