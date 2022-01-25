import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

class RouterController extends GetxController {
  String _currentR = "";
  String _prevR = "";
  String _main = "/alojamiento";
  int c = 0;

  get currentR => _currentR;

  get prevR => _prevR;

  setCurrentR(String s) => _currentR = s;

  setPrevR(String s) => _prevR = s;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    BackButtonInterceptor.remove(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("${info.currentRoute(Get.context!)}wkdjslkajdlkasjkldj");
    print("BACK BUTTON!"); // Do some stuff.
    /*if (["login", "alojamento"]
        .contains(info.currentRoute(Get.context!)!.currentResult!)) {
      print("sdjslkjd");
      SystemNavigator.pop();

    }*/
    /*c++;
    if(c!=2) {
      Get.toNamed(_prevR);
    }
    else{
      c=0;
      Get.toNamed(_main);
    }*/
    return true;
  }
}
