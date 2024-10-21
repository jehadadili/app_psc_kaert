import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/favorite/presntion/cubit/cubit.dart';
import 'package:market/src/feature/favorite/presntion/view/widgets/custom_desin_favor.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FovoriteCubit()..addFavorite,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Favorites Item",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<FovoriteCubit, List<HomeModel>>(
          builder: (context, favorite) {
            if (favorite.isEmpty) {
              return Center(child: Text("There is no favorite element here."));
            }
            return ListView.builder(
              itemCount: favorite.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CustomDesinFavor(
                  homeModel: favorite[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
