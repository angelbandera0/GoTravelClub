import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkRouterBottomBar{
  final int index;

  LinkRouterBottomBar(this.index);

  void link(){
    switch(this.index){
      case 0:{
        Get.offNamed("/alojamiento");
        break;
      }
      case 1:{
        Get.offNamed("/tour");
        break;
      }
      case 2:{
        Get.offNamed("/vuelo");
        break;
      }
    }
  }
}