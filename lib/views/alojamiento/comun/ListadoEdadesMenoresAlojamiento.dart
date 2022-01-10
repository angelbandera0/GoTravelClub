import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesAlojamientoController.dart';
import 'package:gotravelclub/controller/habitacionController.dart';

class ListadoEdadesMenoresAlojamiento extends StatelessWidget {
  final String id;
  final HabitacionController habitacionController;
  ListadoEdadesMenoresAlojamiento({Key? key, required this.id, required this.habitacionController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: id,
        builder: (_) {
          return (habitacionController.camposEdades.isEmpty)
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
                children: habitacionController.camposEdades),
          );
        });
  }
}
