import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/alojamientoController.dart';
import 'package:gotravelclub/views/custom/shimmerLC.dart';

class PopularesAlojamiento extends StatelessWidget {
  Shimmer shimmer = Shimmer();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlojamientoController>(
        id: "popularesAlojamiento",
        builder: (_) {
          return Container(
              height: (!_.isInSearch)?240:0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (_.isShimmer)
                        ? shimmer.listC
                        : (!_.isInSearch)
                            ? (_.w_populares != 0)
                                ? _.w_populares
                                : [
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 200, 0, 0),
                                      child: Column(children: [
                                        Icon(Icons.list,
                                            size: 80, color: Colors.grey),
                                        Text("No hay alojamientos populares",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey)),
                                      ]),
                                    ))
                                  ]
                            : [Container()]),
              ));
        });
  }
}
