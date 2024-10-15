import 'package:flutter/material.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class CustomSuccess extends StatelessWidget {
  const CustomSuccess({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(homeModel.image),
        Text(homeModel.name),
        Text(homeModel.company),
        Text(
          homeModel.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(homeModel.status),
        Text(homeModel.category),
      ],
    );
  }
}

class BodywidgetSuccess extends StatelessWidget {
  const BodywidgetSuccess({super.key, required this.listlabtop});
final List<HomeModel> listlabtop; 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 333,
        child: ListView.builder(
          itemCount: listlabtop.length,
          itemBuilder: (context, index) {
            return CustomSuccess(
              homeModel: listlabtop[index],
            );
          },
        ));
  }
}
