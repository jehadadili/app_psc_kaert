import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/feature/detils/presntation/view/screen/more_deteils.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class ImageProductCardSearch extends StatelessWidget {
  const ImageProductCardSearch({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: InkWell(
        onTap: () {
          context.pushwidget(
            push: MoreDetiels(
              homeModel: homeModel,
            ),
          );
        },
        child: Image.network(
          homeModel.image,
          width: 250.w,
          height: 200.h,
        ),
      ),
    );
  }
}
