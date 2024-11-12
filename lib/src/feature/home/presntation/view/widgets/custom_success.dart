import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/presntation/view/widgets/home_item_container.dart';
import 'package:market/src/feature/home/presntation/view/widgets/image_product_card.dart';

class CustomSuccess extends StatelessWidget {
  const CustomSuccess({
    super.key,
    required this.homeModel,
  });
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: ImageProductCard(homeModel: homeModel),
            ),
            SizedBox(width: 7.w),
            Expanded(
              flex: 7,
              child: HomeItemContainer(
                homeModel: homeModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
