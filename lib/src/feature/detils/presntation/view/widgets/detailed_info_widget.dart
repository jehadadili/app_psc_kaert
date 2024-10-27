import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(homeModel),
              child: Text(homeModel.description),
            ),
            const SizedBox(height: 8),
            HeroWidget(
              tag: HeroTag.addressLine2(homeModel),
              child: Text(homeModel.company),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
}
