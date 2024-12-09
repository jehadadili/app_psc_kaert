import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/presntation/view/widgets/custom_success.dart';

class BodywidgetSuccess extends StatelessWidget {
  const BodywidgetSuccess({
    super.key,
    required this.listlaptop,
  });
  final List<HomeModel> listlaptop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(10.r),
        scrollDirection: Axis.vertical,
        itemCount: listlaptop.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return FadeInUp(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: CustomSuccess(
                homeModel: listlaptop[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
