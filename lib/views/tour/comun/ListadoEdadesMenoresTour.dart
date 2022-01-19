import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesTourController.dart';
import 'package:gotravelclub/controller/habitacionController.dart';
import 'package:gotravelclub/controller/habitacionTourController.dart';

class ListadoEdadesMenoresTour extends StatelessWidget {
  final String id;
  final HabitacionTourController habitacionTourController;
  ListadoEdadesMenoresTour({Key? key, required this.id, required this.habitacionTourController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesTourController>(
        id: id,
        builder: (_) {
          return (habitacionTourController.camposEdades.isEmpty)
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
                children: habitacionTourController.camposEdades),
          );
        });
  }
}
