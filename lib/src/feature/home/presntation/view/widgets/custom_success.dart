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
      child: Row(
        children: [
          ImageProductCard(homeModel: homeModel),
          SizedBox(width: 7.w),
          HomeItemContainer(
            homeModel: homeModel,
          )
        ],
      ),
    );
  }
}
