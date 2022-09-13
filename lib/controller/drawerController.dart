import 'package:flutter_zoom_drawer/config.dart';
//import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/bottomController.dart';

class MyDrawerController extends GetxController {
  int current = 0;
  final zoomDrawerController = ZoomDrawerController();

  setCurrent(int index,String route) {
    BottomController bc = Get.find<BottomController>();
    current = index;
  update(["drawer"]);
  if([0,1,2].contains(current)) {
    bc.setIndex(current);
    bc.update();
  }
  Get.offNamed(route);
  }
  setCurrentIndex(int index)=>current=index;

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
