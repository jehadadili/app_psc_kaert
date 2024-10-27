import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/locations_widget.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class MoreDetiels extends StatelessWidget {
  const MoreDetiels({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey[500],
        appBar: buildAppBar(),
        body: LocationsWidget(
          homeModel: homeModel,
        ),
      );

  PreferredSizeWidget buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[500],
        title: Text(
          'Moor Detils',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30.sp),
        centerTitle: true,
      );
}
