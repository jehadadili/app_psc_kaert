import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_tag.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_widget.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class ExpandedContentWidget extends StatelessWidget {
  final HomeModel homeModel;

  const ExpandedContentWidget({
    super.key,
    required this.homeModel,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(homeModel),
              child: Text(
                homeModel.description,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.h),
            buildAddressRating(homeModel: homeModel),
            const SizedBox(height: 12),
            buildReview(homeModel: homeModel),
          ],
        ),
      );

  Widget buildAddressRating({
    required HomeModel homeModel,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeroWidget(
            tag: HeroTag.addressLine2(homeModel),
            child: Text(
              " \$ ${homeModel.price.toString()}",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );

  // استخدام index لضمان علامة فريدة لكل صورة
  Widget buildReview({
    required HomeModel homeModel,
  }) =>
      Row(
        children: homeModel.images.asMap().entries.map((entry) {
          final index = entry.key;
          final image = entry.value;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: HeroWidget(
              tag: HeroTag.avatar(homeModel, index), // تمرير index هنا
              child: CircleAvatar(
                radius: 25.r,
                backgroundColor: Colors.blueGrey[500],
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
            ),
          );
        }).toList(),
      );
}
