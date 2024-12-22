import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_tag.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_widget.dart';

import 'package:market/src/feature/home/domain/model/home_model.dart';

class ImageWidget extends StatelessWidget {
  final HomeModel homeModel;

  const ImageWidget({
    super.key,
    required this.homeModel,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.6,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  buildTopText(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(homeModel.image),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: Image.network(
              homeModel.image,
              width: 300.w,
            ),
          ),
        ),
      );

  Widget buildTopText() => Text(
        homeModel.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
}
