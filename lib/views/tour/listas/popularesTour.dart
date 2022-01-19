import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/tourController.dart';
import 'package:gotravelclub/views/custom/shimmerLC.dart';

class PopularesTour extends StatelessWidget {
  Shimmer shimmer= Shimmer();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourController>(
        id: "popularesTour",
        init: TourController(),
        builder: (_) {
          return Container(
              height: 240,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:(_.isShimmer)?shimmer.listC: _.w_populares
                ),
              ));
        });
  }
}
