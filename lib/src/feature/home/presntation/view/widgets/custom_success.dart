import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class CustomSuccess extends StatelessWidget {
  const CustomSuccess({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 110.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorApp.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Hero(
            tag: homeModel.image,
            child: Image.network(
              homeModel.image,
            ),
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
        Container(
          width: 230.w, // تعيين عرض كل كارد
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorApp.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
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
                    Text(
                      homeModel.name,
                      style: TextStyle(
                        color: ColorApp.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      homeModel.company,
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
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      homeModel.status,
                      style: TextStyle(
                          color: ColorApp.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Text(
                      homeModel.price.toString(),
                      style: TextStyle(
                          color: ColorApp.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      "\$ ${homeModel.sales.toString()}",
                      style: TextStyle(
                          color: ColorApp.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: ColorApp.green,
                      ),
                    )
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
