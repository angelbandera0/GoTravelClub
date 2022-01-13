import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/controller/tourController.dart';
import 'package:gotravelclub/helper/link_router_bottom_bar.dart';
import 'package:gotravelclub/views/custom/cuadro_corto.dart';
import 'package:gotravelclub/views/custom/cuadro_largo.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/drawer.dart';
import 'package:gotravelclub/widgets/option.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';

class Tour extends StatelessWidget {
  late MyDrawerController drawerController;

  Tour({Key? key}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourController>(
        id: "tour",
        init: TourController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainTour());
        });
  }
}

class MainTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourController>(builder: (_) {
      return Scaffold(
          appBar: PreferredSize(
            child: Stack(
              children: [
                ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: 130,fit: BoxFit.cover,),),
                Container(
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
              ],
            ),
            preferredSize: Size(Get.width, 130),
          ),
          body: Stack(
            children: [
              ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: Get.height,fit: BoxFit.cover,),),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Text(
                          "Populares",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xff621771)),
                        ),
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
                                  url: "assets/muestra/tour1.png",
                                  nombre: "Playa Bonita",
                                  ubicacion: "Ecuador - Chimborazo - Riobamba",
                                  urlDetails: "/tourDetalles",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CuadroCorto(
                                  url: "assets/muestra/tour2.png",
                                  nombre: "Palma Azul",
                                  ubicacion: "Ecuador - Chimborazo - Riobamba",
                                  urlDetails: "/tourDetalles",
                                ),

                                //CuadroCorto(),
                                SizedBox(
                                  width: 10,
                                ),
                                CuadroCorto(
                                  url: "assets/muestra/tour3.png",
                                  nombre: "Monte Real",
                                  ubicacion: "Ecuador - Chimborazo - Riobamba",
                                  urlDetails: "/tourDetalles",
                                ),

                                //CuadroCorto(),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      CuadroLargo(
                        url: "assets/muestra/tour1.png",
                        nombre: "Playa Bonita",
                        ubicacion: "Ecuador - Chimborazo - Riobamba",
                        urlDetails: "/tourDetalles",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CuadroLargo(
                        url: "assets/muestra/tour2.png",
                        nombre: "Palma Azul",
                        ubicacion: "Ecuador - Chimborazo - Riobamba",
                        urlDetails: "/tourDetalles",
                      ),

                      //CuadroCorto(),
                      SizedBox(
                        height: 20,
                      ),
                      CuadroLargo(
                        url: "assets/muestra/tour3.png",
                        nombre: "Monte Real",
                        ubicacion: "Ecuador - Chimborazo - Riobamba",
                        urlDetails: "/tourDetalles",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Color(0xff621771),
            items: [
              TabItem(icon: Icons.home, title: 'Alojamientos'),
              TabItem(icon: Icons.public, title: 'Tours'),
              TabItem(icon: Icons.place, title: 'Escapadas'),
              TabItem(icon: Icons.flight, title: 'Vuelos'),
            ],
            initialActiveIndex: 1, //optional, default as 0
            onTap: (int i) {
              LinkRouterBottomBar(i).link();
            },
          ));
    });
  }
}
