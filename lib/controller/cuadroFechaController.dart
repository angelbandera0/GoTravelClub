import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CuadroFechaController extends GetxController {
  late String _fecha;

  String get fecha => _fecha;

  void setFecha(fecha) => _fecha = fecha;

  @override
  void onInit() {
    super.onInit();
    try {
      _fecha = "__/__/____";
      //   instanceSearchController = Get.find<SearchController>();
    } catch (e) {}
    // _startDirectoryRoute();
  }
}
