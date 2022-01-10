import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/views/inicio/local/opcion.dart';
import 'package:gotravelclub/widgets/appBar.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 35, 20, 0),

            //color: Colors.blue,

            child: Column(
              children: [
                AppBarr(),
              ],
            ),
          ),
        ),
        preferredSize: Size(Get.width, 70),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                elevation: 6,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                  ),
                  items: ["escapada.png", "tour2.png", "alo3.png"].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: Get.width,
                          //margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/muestra/$i",
                              fit: BoxFit.cover,
                              width: Get.width,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitleWithDivider(title: "Información"),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Opcion(label: "Acerca de", icon: Icons.flight, color: Color(0xff621771).withOpacity(0.7), url: "/acerca"),

                    Opcion(label: "Contacto", icon: Icons.flight, color: Color(0xff621771).withOpacity(0.7), url: "/acerca"),
                    Opcion(label: "Contacto", icon: Icons.flight, color: Color(0xff621771).withOpacity(0.7), url: "/acerca"),

                  ],
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitleWithDivider(title: "Opciones"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Opcion(label: "Alojamientos", icon: Icons.home, color: Color(0xff621771).withOpacity(0.7), url: "/alojamiento"),
                    Opcion(label: "Tours", icon: Icons.public, color:Color(0xff621771).withOpacity(0.7), url: "/tour"),
                    Opcion(label: "Escapadas", icon: Icons.place, color: Color(0xff621771).withOpacity(0.7), url: "/escapada"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Opcion(label: "Vuelos", icon: Icons.flight, color: Color(0xff621771).withOpacity(0.7), url: "/vuelo"),
                    Opcion(label: "Cotizaciones", icon: Icons.money, color: Color(0xff621771).withOpacity(0.7), url: "/cotizaciones"),
                    Container(width: Get.width * 0.25,
                      height: Get.width * 0.25,color: Colors.white,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
