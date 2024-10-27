import 'package:flutter/material.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/detailed_info_widget.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_tag.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/hero_widget.dart';
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
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Moor Detils'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
            const SizedBox(width: 10)
          ],
          leading: const Icon(Icons.search_outlined),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox.expand(
                child: HeroWidget(
                  tag: HeroTag.image(homeModel.image),
                  child: Image.network(
                    homeModel.image,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            DetailedInfoWidget(homeModel: homeModel),
          ],
        ),
      );
}
