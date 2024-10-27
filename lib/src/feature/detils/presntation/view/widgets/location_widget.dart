import 'package:flutter/material.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/detail_page.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/expanded_content_widget.dart';
import 'package:market/src/feature/detils/presntation/view/widgets/image_widget.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class LocationWidget extends StatefulWidget {
  final HomeModel homeModel;

  const LocationWidget({
    super.key,
    required this.homeModel,
  });

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? 40 : 100,
          width: isExpanded ? size.width * 0.78 : size.width * 0.7,
          height: isExpanded ? size.height * 0.6 : size.height * 0.5,
          child: ExpandedContentWidget(homeModel: widget.homeModel),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? 150 : 100,
          child: GestureDetector(
            onPanUpdate: onPanUpdate,
            onTap: openDetailPage,
            child: ImageWidget(homeModel: widget.homeModel),
          ),
        ),
      ],
    );
  }

  void openDetailPage() {
    if (!isExpanded) {
      /// Tap to expand card
      setState(() => isExpanded = true);
      return;
    }

    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child:
                DetailPage(homeModel: widget.homeModel, animation: animation),
          );
        },
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
