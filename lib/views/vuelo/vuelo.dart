import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/controller/vueloController.dart';
import 'package:gotravelclub/helper/link_router_bottom_bar.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/drawer.dart';
import 'package:gotravelclub/widgets/loading.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Vuelo extends StatelessWidget {
  late MyDrawerController drawerController;

  Vuelo({Key? key}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: "vuelo",
        init: VueloController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainVuelo());
        });
  }
}

class MainVuelo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: "vuelo",
        init: VueloController(),
        builder: (_) {
          return Stack(
            children: [
              Scaffold(
                appBar: PreferredSize(
                  child: Stack(
                    children: [
                      ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: 136,fit: BoxFit.cover,),),
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
                              Material(
                                elevation: 4,borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: ToggleSwitch(
                                  initialLabelIndex: _.index,
                                  minWidth: 150,
                                  minHeight: 50.0,
                                  cornerRadius: 30.0,
                                  activeBgColor: [Color(0xffAFACF9)],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Color(0xffEEECEC),
                                  inactiveFgColor: Colors.grey[900],
                                  totalSwitches: 2,
                                  labels: ['Ida y Vuelta', 'Solo Ida'],
                                  onToggle: (index) {
                                    print('switched to: $index');
                                    _.cambiarTab(index);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  preferredSize: Size(Get.width, 136),
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
                        child: _.body,
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: ConvexAppBar(
                  backgroundColor: Color(0xff621771),
                  items: [
                    TabItem(icon: Icons.home, title: 'Alojamientos'),
                    TabItem(icon: Icons.public, title: 'Tours'),
                    TabItem(icon: Icons.flight, title: 'Vuelos'),
                  ],
                  initialActiveIndex: 2, //optional, default as 0
                  onTap: (int i) {
                    LinkRouterBottomBar(i).link();
                  },
                ),
              ),
              LoadingDetallesAlojamiento()
            ],
          );
        });

  }
}

class LoadingDetallesAlojamiento extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: "loading",
        builder: (_) {
          return (_.isLoading)?Loading():Container();
        });
  }

}