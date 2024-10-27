import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/location_widget.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  State<LocationsWidget> createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 550.h,
            width: 500.w,
            child: LocationWidget(homeModel: widget.homeModel),
          )
        ],
      );
}
