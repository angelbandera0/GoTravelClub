import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/alojamientoController.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/helper/link_router_bottom_bar.dart';
import 'package:gotravelclub/views/alojamiento/listas/listasAlojamiento.dart';
import 'package:gotravelclub/views/alojamiento/listas/popularesAlojamiento.dart';
import 'package:gotravelclub/views/custom/cuadro_corto.dart';
import 'package:gotravelclub/views/custom/cuadro_largo.dart';
import 'package:gotravelclub/views/custom/shimmerCuadroCC.dart';
import 'package:gotravelclub/views/custom/shimmerCuadroLargo.dart';
import 'package:gotravelclub/views/custom/shimmerLC.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/drawer.dart';
import 'package:gotravelclub/widgets/loading.dart';
import 'package:gotravelclub/widgets/loading_appbar.dart';
import 'package:gotravelclub/widgets/option.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';
import 'package:easy_debounce/easy_debounce.dart';

class Alojamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlojamientoController>(
        id: "alojamiento",
        init: AlojamientoController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainAlojamiento());
        });
  }
}

class MainAlojamiento extends StatelessWidget {
  Shimmer shimmer = Shimmer();
  TextEditingController searchCtrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlojamientoController>(builder: (_) {
      _.getAlojamientos();
      return Stack(
        children: [
          Scaffold(
              appBar: PreferredSize(
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        "assets/fondo/fondo.png",
                        width: Get.width,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                              textEditingController: searchCtrl,
                              textInputType: TextInputType.text,
                              function: () {
                                EasyDebounce.debounce(
                                    'my-debouncer',                 // <-- An ID for this particular debouncer
                                    Duration(milliseconds: 1000),    // <-- The debounce duration
                                        () => _.search(searchCtrl.text)                // <-- The target method
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    //LoadingAppBarAlojamiento(),
                  ],
                ),
                preferredSize: Size(Get.width, 130),
              ),
              body: Stack(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "assets/fondo/fondo.png",
                      width: Get.width,
                      height: Get.height,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Populares",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff621771)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //populares
                          PopularesAlojamiento(),
                          SizedBox(
                            height: 20,
                          ),
                          //alojamientos
                          ListaAlojamiento(),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            child: CustomButton(
                              text: "Cargar Más",
                              onPress: () {
                                _.loadMore();
                              },
                              color: Color(0xff56E2C6),
                            ),
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
                initialActiveIndex: 0, //optional, default as 0
                onTap: (int i) {
                  LinkRouterBottomBar(i).link();
                },
              )),
          LoadingAlojamiento(),

        ],
      );
    });
  }
}

class LoadingAlojamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlojamientoController>(
        id: "loading",
        builder: (_) {
          return (_.isLoading) ? Loading() : Container();
        });
  }
}

class LoadingAppBarAlojamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlojamientoController>(
        id: "loadingAppBar",
        builder: (_) {
          return (_.isLoading) ? LoadingAppbar() : Container();
        });
  }
}


