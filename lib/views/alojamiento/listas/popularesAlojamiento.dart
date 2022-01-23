import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/alojamientoController.dart';
import 'package:gotravelclub/views/custom/shimmerLC.dart';

class PopularesAlojamiento extends StatelessWidget {
  Shimmer shimmer= Shimmer();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlojamientoController>(
        id: "popularesAlojamiento",
        builder: (_) {
          return (!_.isInSearch)?Container(
              height: 240,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:(_.isShimmer)?shimmer.listC: _.w_populares
                ),
              )):Container();
        });
  }
}
