import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarr extends StatelessWidget {
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
              Icons.apps,
              size: 28,
              color: Color(0xff621771),
            ),
            onPressed: () {
              Get.toNamed("/inicio");
            }),
      ],
    );
  }
}
