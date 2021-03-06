import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/tourController.dart';
import 'package:gotravelclub/views/custom/failed_search.dart';
import 'package:gotravelclub/views/custom/shimmerLC.dart';

class ListaTour extends StatelessWidget {
  Shimmer shimmer = Shimmer();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourController>(
        id: "listaTour",
        builder: (_) {
          return Column(
              children: ((_.isShimmer)
                  ? shimmer.listL
                  : (_.w_tours.length != 0)
                      ? _.w_tours
                      : [FailedSearch()]));
        });
  }
}
