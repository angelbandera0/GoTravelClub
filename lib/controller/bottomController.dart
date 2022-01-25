import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

class BottomController extends GetxController {
  int _index = 0;

  int get index => _index;

  setIndex(int i) {
    _index = i;
  }

  void updatedBottom(String url){
    switch(url){
      case "/alojamiento":{
        //Get.toNamed("/alojamiento");
        _index=0;
        break;
      }
      case "/tour":{
        _index=1;
        break;
      }
      case "/vuelo":{
        _index=2;
        break;
      }
    }
    update();
  }
}
