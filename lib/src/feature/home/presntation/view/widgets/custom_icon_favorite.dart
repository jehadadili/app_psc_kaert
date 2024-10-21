import 'package:flutter/material.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/favorite/presntion/view/screen/fovorite_screen.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class CustomIconFavorite extends StatefulWidget {
  const CustomIconFavorite({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  State<CustomIconFavorite> createState() => _CustomIconFavoriteState();
}

class _CustomIconFavoriteState extends State<CustomIconFavorite> {
  bool iconfav = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          iconfav = false;
        });

        context.pushwidget(push: FavoriteScreen());
      },
      icon: Icon(
        iconfav ? Icons.favorite_border_outlined : Icons.favorite,
        color: ColorApp.red,
      ),
    );
  }
}
