import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesTourController.dart';

import 'dots_tour.dart';

class ListadoHabitacionesTour extends StatelessWidget {
  String _id = "listadoHabitacionesTour";

  @override
  Widget build(BuildContext context) {
    print(Get.height * 0.44);
    return GetBuilder<DetallesTourController>(
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
                      height: 335,
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
                DotsTour(
                    carouselController: _.carouselController, list: _.listadoHabitaciones)
              ],
            ),
          );
        });
  }
}
