import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/bottomController.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/helper/link_router_bottom_bar.dart';

class BottonBar extends StatelessWidget {
  late MyDrawerController dc;

  BottonBar({Key? key}) : super(key: key){
    dc=Get.find<MyDrawerController>();

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomController>(
        id: "bottomBar",
        builder: (_) {
          return ConvexAppBar(
            backgroundColor: Color(0xff621771),
            items: [
              TabItem(icon: Icons.home, title: 'Alojamientos'),
              TabItem(icon: Icons.public, title: 'Tours'),
              TabItem(icon: Icons.flight, title: 'Vuelos'),
            ],
            initialActiveIndex: _.index,   //optional, default as 0
            onTap: (int i) {
              dc.setCurrentIndex(i);
              _.setIndex(i);
              LinkRouterBottomBar(i).link();
            },
          );
        });
  }
}
