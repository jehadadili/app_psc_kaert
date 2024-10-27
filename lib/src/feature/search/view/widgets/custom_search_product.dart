import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/search/view/widgets/home_item_search.dart';
import 'package:market/src/feature/search/view/widgets/image_product_card.dart';

class CustomSearchProduct extends StatelessWidget {
  const CustomSearchProduct({
    super.key,
    required this.homeModel,
  });
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Card(
        elevation: 5,
        color: ColorApp.white,
        child: SizedBox(
          width: 150,
          height: 100,
          child: Row(
            children: [
              ImageProductCardSearch(homeModel: homeModel),
              SizedBox(width: 20.w),
              HomeItemSearch(
                homeModel: homeModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
