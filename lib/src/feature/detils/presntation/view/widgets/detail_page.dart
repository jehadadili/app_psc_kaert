import 'package:flutter/material.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/detail_info.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/image_carousel.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class DetailPage extends StatelessWidget {
  final HomeModel homeModel;
  final Animation<double> animation;

  const DetailPage({
    super.key,
    required this.homeModel,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('More Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCarousel(imageUrls: homeModel.images),
            const SizedBox(height: 50),
            DetailInfo(
              homeModel: homeModel,
            ),
          ],
        ),
      ),
    );
  }
}
