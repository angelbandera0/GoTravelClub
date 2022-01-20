import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkRouterBottomBar{
  final int index;

  LinkRouterBottomBar(this.index);

  void link(){
    switch(this.index){
      case 0:{
        Get.toNamed("/alojamiento");
        break;
      }
      case 1:{
        Get.toNamed("/tour");
        break;
      }
      case 2:{
        Get.toNamed("/vuelo");
        break;
      }
    }
  }
}