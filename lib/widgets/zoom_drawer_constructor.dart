import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/drawerController.dart';

import 'drawer.dart';

class ZoomDrawerConstructor extends StatelessWidget {
  late MyDrawerController drawerController;
  final Widget mainScreen;

  ZoomDrawerConstructor({Key? key, required this.mainScreen}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drawerController.zoomDrawerController,
      menuScreen: MenuScreen(),
      mainScreen: this.mainScreen,
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      //isRtl: true,
      backgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * 0.5,
    );
  }
}
