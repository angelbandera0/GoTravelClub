import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notificacion{

  void notificar({required String body,required String type}){
    switch(type){
      case "error":{
        Get.snackbar("Ha ocurrido un error", body,
            //snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,duration: Duration(seconds: 3),
            colorText: Colors.white,icon: Icon(Icons.error,size: 30,color: Colors.white,));
        break;
      }
      case "success":{
        Get.snackbar("Información", body,
            //snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff56E2C6),duration: Duration(seconds: 3),
            colorText: Colors.white,icon: Icon(Icons.info,size: 30,color: Colors.white,));
      }
    }
  }
}