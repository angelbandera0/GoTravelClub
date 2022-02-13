import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/alojamientoController.dart';
import 'package:gotravelclub/views/custom/failed_search.dart';
import 'package:gotravelclub/views/custom/shimmerLC.dart';

class ListaAlojamiento extends StatelessWidget {
  Shimmer shimmer = Shimmer();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlojamientoController>(
        id: "listaAlojamiento",
        builder: (_) {
          return Column(
              children: (_.isShimmer)
                  ? shimmer.listL
                  : (_.w_alojamientos.length != 0)
                      ? _.w_alojamientos
                      : [FailedSearch()]);
        });
  }
}
