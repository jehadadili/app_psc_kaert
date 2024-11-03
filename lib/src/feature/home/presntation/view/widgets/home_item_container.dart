import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/presntation/view/widgets/custom_icon_favorite.dart';

class HomeItemContainer extends StatelessWidget {
  const HomeItemContainer({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    homeModel.name,
                    style: TextStyle(
                      color: ColorApp.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  homeModel.status,
                  style: TextStyle(
                    color: ColorApp.bluedark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.h),
            Text(
              homeModel.description,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  "\$ ${homeModel.price.toString()}",
                  style: TextStyle(
                    color: ColorApp.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                CustomIconFavorite(homeModel: homeModel),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context)
                        .addCart(id: homeModel.id);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: ColorApp.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
