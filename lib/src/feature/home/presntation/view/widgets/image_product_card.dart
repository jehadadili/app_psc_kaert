import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/extation/extation_navgter.dart';
import 'package:market/src/feature/detils/presntation/view/screen/more_deteils.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class ImageProductCard extends StatelessWidget {
  const ImageProductCard({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfff8f8f8),
      child: SizedBox(
        width: 90.w,
        height: 100.h,
        child: InkWell(
          onTap: () {
            context.pushwidget(
              push: MoreDetiels(
                homeModel: homeModel,
              ),
            );
          },
      //    child: Hero(
        //    tag: homeModel.images.isNotEmpty ? homeModel.images[0] : '',
            child: Padding(
              padding: EdgeInsets.all(5.r),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: homeModel.image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.broken_image);
                    },
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "More ...",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
