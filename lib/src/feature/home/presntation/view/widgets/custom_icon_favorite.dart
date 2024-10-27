import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/favorite/presntion/cubit/cubit.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class CustomIconFavorite extends StatefulWidget {
  const CustomIconFavorite({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  State<CustomIconFavorite> createState() => _CustomIconFavoriteState();
}

class _CustomIconFavoriteState extends State<CustomIconFavorite> {
  bool iconfav = false;

  @override
  void initState() {
    super.initState();
   
    iconfav =
        BlocProvider.of<FavoriteCubit>(context).isFavorite(widget.homeModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          iconfav = !iconfav;
        });
        if (iconfav) {
          BlocProvider.of<FavoriteCubit>(context)
              .addFavorite(homemodel: widget.homeModel);
        } else {
          // إزالة من المفضلة
          BlocProvider.of<FavoriteCubit>(context)
              .removefROMfavority(id: widget.homeModel.id);
        }
      },
      icon: Icon(
        iconfav ? Icons.favorite : Icons.favorite_border_outlined,
        color: ColorApp.red,
      ),
    );
  }
}
