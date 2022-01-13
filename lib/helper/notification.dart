import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notificacion{

  void notificar({required String body,required String type}){
    switch(type){
      case "error":{
        Get.snackbar("Ha ocurrido un error", body,
            //snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,icon: Icon(Icons.error,size: 30,color: Colors.white,));
      }
    }
  }
}