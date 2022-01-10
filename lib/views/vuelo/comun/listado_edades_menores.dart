import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/vueloController.dart';

class ListadoEdadesMenores extends StatelessWidget {
  final String id;

  const ListadoEdadesMenores({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: id,
        builder: (_) {
          return (_.camposEdades.isEmpty)
              ? Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "No hay menores agregados.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ))
              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: _.camposEdades),
          );
        });
  }
}
