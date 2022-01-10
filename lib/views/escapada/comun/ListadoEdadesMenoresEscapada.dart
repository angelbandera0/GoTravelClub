import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesEscapadaController.dart';
import 'package:gotravelclub/controller/habitacionEscapadaController.dart';

class ListadoEdadesMenoresEscapada extends StatelessWidget {
  final String id;
  final HabitacionEscapadaController habitacionController;
  ListadoEdadesMenoresEscapada({Key? key, required this.id, required this.habitacionController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesEscapadaController>(
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
