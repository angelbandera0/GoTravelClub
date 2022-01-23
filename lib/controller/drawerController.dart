import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyDrawerController extends GetxController {
  int current = 0;
  final zoomDrawerController = ZoomDrawerController();

  setCurrent(int index,String route) {
    current = index;
  update(["drawer"]);
  Get.offAndToNamed(route);
  }

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
