import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesAlojamientoController.dart';
import 'package:gotravelclub/views/alojamiento/comun/dots_alojamiento.dart';
import 'package:gotravelclub/views/alojamiento/comun/habitacion_alojamiento.dart';

class ListadoHabitacionesAlojamiento extends StatelessWidget {
  String _id = "listadoHabitacionesAlojamiento";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: _id,
        builder: (_) {
          return (_.listadoHabitaciones.isEmpty)
              ? Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "No hay habitaciones agregadas.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ))
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: Get.height * 0.44,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        _.updateDots(index);
                      }),
                  items: _.listadoHabitaciones.map((habitacion) {
                    return Builder(
                      builder: (BuildContext context) {
                        return habitacion;
                      },
                    );
                  }).toList(),
                ),
                DotsAlojamiento(
                    carouselController: _.carouselController, list: _.listadoHabitaciones)
              ],
            ),
          );
        });
  }
}
