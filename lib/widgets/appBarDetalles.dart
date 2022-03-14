import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/drawerController.dart';

class AppBarDetalles extends StatelessWidget {
  late MyDrawerController myDrawerController;
  final String routeBack;

  AppBarDetalles({Key? key, required this.routeBack}) : super(key: key) {
    myDrawerController = Get.find<MyDrawerController>();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent, // Button color
                child: InkWell(
                  splashColor: Color(0xff621771),
                  // Splash color
                  onTap: () {
                    Get.offNamed(routeBack);
                  },
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Color(0xff56E2C6),
                      )),
                ),
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent, // Button color
                child: InkWell(
                  splashColor: Color(0xff621771),
                  // Splash color
                  onTap: () {
                    myDrawerController.toggleDrawer();
                  },
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.menu,
                        size: 25,
                        color: Color(0xff56E2C6),
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
