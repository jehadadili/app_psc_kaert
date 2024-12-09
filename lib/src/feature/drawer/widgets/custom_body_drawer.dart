import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/feature/cart/presntation/view/screen/cart_screen.dart';
import 'package:market/src/feature/favorite/presntion/view/screen/fovorite_screen.dart';
import 'package:market/src/feature/user_profile/presntation/view/screen/user_profile_screen.dart';

class CustomBodyDrawer extends StatelessWidget {
  const CustomBodyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.white,
            size: 25.sp,
          ),
          title: Text(
            "user profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          onTap: () {
            context.pushwidget(push: const UserProfileScreen());
          },
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 25.sp,
          ),
          title: Text(
            "favorite",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          onTap: () {
            context.pushwidget(push: const FavoriteScreen());
          },
        ),
        ListTile(
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 27.sp,
          ),
          title: Text(
            "Cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          onTap: () {
            context.pushwidget(push: const CartScreen());
          },
        ),
        const Expanded(
          child: SizedBox(),
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.white,
            size: 25.sp,
          ),
          title: Text(
            "Log-Out",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          onTap: () {
            //    showLogoutDialog(context);
          },
        ),
      ],
    );
  }
}
