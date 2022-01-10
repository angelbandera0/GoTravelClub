import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/helper/link_router_bottom_bar.dart';
import 'package:gotravelclub/views/custom/cuadro_corto.dart';
import 'package:gotravelclub/views/custom/cuadro_largo.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/option.dart';

class Escapada extends StatelessWidget {
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
                  SizedBox(
                    height: 10,
                  ),
                  CustomInput1(
                    icon: Icons.search,
                    placeholder: "Buscar",
                    isPassword: true,
                    textEditingController: TextEditingController(),
                    textInputType: TextInputType.text,
                    function: () {},
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(Get.width, 136),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Populares",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xff621771)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 240,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CuadroCorto(
                            url: "assets/muestra/escapada.png",
                            nombre: "Cordilleras del Indio",
                            ubicacion: "Ecuador - Chimborazo - Riobamba",
                            urlDetails: "/escapadaDetalles",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CuadroCorto(
                            url: "assets/muestra/escapada.png",
                            nombre: "Montañas Del Sol",
                            ubicacion: "Ecuador - Chimborazo - Riobamba",
                            urlDetails: "/escapadaDetalles",
                          ),

                          //CuadroCorto(),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                CuadroLargo(
                  url: "assets/muestra/escapada.png",
                  nombre: "Cordilleras del Indio",
                  ubicacion: "Ecuador - Chimborazo - Riobamba",
                  urlDetails: "/escapadaDetalles",
                ),
                SizedBox(
                  height: 20,
                ),
                CuadroLargo(
                  url: "assets/muestra/escapada.png",
                  nombre: "Montañas Del Sol",
                  ubicacion: "Ecuador - Chimborazo - Riobamba",
                  urlDetails: "/escapadaDetalles",
                ),

                //CuadroCorto(),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Color(0xff621771),
          items: [
            TabItem(icon: Icons.home, title: 'Alojamientos'),
            TabItem(icon: Icons.public, title: 'Tours'),
            TabItem(icon: Icons.place, title: 'Escapadas'),
            TabItem(icon: Icons.flight, title: 'Vuelos'),
          ],
          initialActiveIndex: 2, //optional, default as 0
          onTap: (int i) {
            LinkRouterBottomBar(i).link();
          },
        ));
  }
}
