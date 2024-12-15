import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/favorite/presntion/cubit/cubit.dart';
import 'package:market/src/feature/favorite/presntion/view/widgets/custom_desin_favor.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[500],
        title: Text(
          "Favorites",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Your favorite items are saved here",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: BlocBuilder<FavoriteCubit, List<HomeModel>>(
              builder: (context, favorite) {
                if (favorite.isEmpty) {
                  return const Center(
                      child: Text("There is no favorite element here."));
                }
                return ListView.builder(
                  itemCount: favorite.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(favorite[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        BlocProvider.of<FavoriteCubit>(context)
                            .removefROMfavority(id: favorite[index].id);
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: CustomDesinFavor(
                        homeModel: favorite[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
