import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/drawerController.dart';

class AppBarr extends StatelessWidget {
  late MyDrawerController myDrawerController;

  AppBarr({Key? key}) : super(key: key){
    myDrawerController=Get.find<MyDrawerController>();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width:60,height:60,child: const Image(image:AssetImage('assets/logo.png',))),
        Text(
          "Gotravelclub",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xff621771), fontSize: 25),
        ),
        IconButton(
            icon: Icon(
              Icons.menu,
              size: 28,
              color: Color(0xff621771),
            ),
            onPressed: () {
              //ZoomDrawer.of(context)!.close();
              //myDrawerController.toggleDrawer();
              Get.toNamed("/escapada");
            }),
      ],
    );
  }
}
