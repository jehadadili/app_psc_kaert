import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class CustomDesinFavor extends StatelessWidget {
  const CustomDesinFavor({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Card(
            color: const Color(0xfff5faff),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        homeModel.name,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Center(
                        child: Image.network(
                          homeModel.image,
                          width: 250.w,
                          height: 150.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      OverflowBar(
                        overflowSpacing: 5,
                        overflowAlignment: OverflowBarAlignment.center,
                        children: [
                          Text(
                            homeModel.description,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "\$ ${homeModel.price}",
                        style: TextStyle(
                          color: ColorApp.blue,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
