import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/presntation/cubit/cubit.dart';
import 'package:market/src/feature/home/presntation/view/widgets/custom_icon_favorite.dart';

class CustomSuccess extends StatelessWidget {
  const CustomSuccess(
      {super.key, required this.homeModel, required this.laptopCubit});
  final HomeModel homeModel;
  final LaptopCubit laptopCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: ColorApp.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: ColorApp.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
              BoxShadow(
                color: ColorApp.white.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(-4, -4),
              ),
            ],
          ),
          child: InkWell(
            child: Hero(
              tag: homeModel.images,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  children: [
                    Image.network(
                      homeModel.image,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "More ...",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
        Container(
          width: 230.w,
          decoration: BoxDecoration(
            color: ColorApp.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(-4, -4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 7.w,
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
                SizedBox(
                  height: 7.h,
                ),
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
                SizedBox(
                  height: 5.h,
                ),
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
                     CustomIconFavorite(
                      homeModel: homeModel,
                    ),
                    IconButton(
                      onPressed: () {},
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
        ),
      ],
    );
  }
}
