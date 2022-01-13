import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            width: Get.width,
            height: Get.height,
            color: Colors.black45,
            child: Center(
              child: Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff636863),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: CircularProgressIndicator(
                    color: Color(0xff52E2C6),
                    strokeWidth: 7,
                  )),
            ),
          );
  }
}
