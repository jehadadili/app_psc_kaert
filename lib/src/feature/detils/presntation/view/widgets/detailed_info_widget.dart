import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_tag.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_widget.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class DetailedInfoWidget extends StatelessWidget {
  final HomeModel homeModel;

  const DetailedInfoWidget({
    super.key,
    required this.homeModel,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(homeModel),
              child: Text(
                homeModel.name,
                style: TextStyle(
                  color: ColorApp.charcoalBlue,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Decription",
              style: TextStyle(
                color: ColorApp.charcoalBlue,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            HeroWidget(
              tag: HeroTag.addressLine1(homeModel),
              child: Text(homeModel.description),
            ),
            SizedBox(height: 8.h),
            HeroWidget(
              tag: HeroTag.addressLine2(homeModel),
              child: Text(homeModel.category),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      );
}
