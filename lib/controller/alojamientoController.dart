import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/models/request/alojamiento.dart';
import 'package:gotravelclub/models/response/alojamientoResponse.dart';
import 'package:gotravelclub/services/alojamiento_service.dart';
import 'package:gotravelclub/views/custom/cuadro_corto.dart';
import 'package:gotravelclub/views/custom/cuadro_largo.dart';

class AlojamientoController extends GetxController {
  AlojamientoService alojamientoService =
      AlojamientoService(DioClient().init());
  List<Alojamiento> populares = [];
  List<Alojamiento> alojamientos_list = [];
  List<Widget> w_populares = [];
  List<Widget> w_alojamientos = [];
  bool isShimmer=true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAlojamientos();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("axsdxs");
  }

  void getAlojamientos() async {
    AlojamientoResponse alojamientoResponse =
        await alojamientoService.getAlojamientos(1);
    populares = alojamientoResponse.popular!;
    alojamientos_list = alojamientoResponse.data!;
    print("object");
    createListCortos();
    createListLargos();
    isShimmer=false;
    update(["listaAlojamiento","popularesAlojamiento"]);
  }

  void createListCortos() {
    populares.forEach((element) {
      w_populares.add(CuadroCorto(
          url: element.imagen1!,
          nombre: element.name!,
          ubicacion: "${element.country} - ${element.state} - ${element.city}",
          urlDetails: "/alojamientoDetalles"));
    });
  }

  void createListLargos() {
    alojamientos_list.forEach((element) {
      w_alojamientos.add(CuadroLargo(
          url: element.imagen1!,
          nombre: element.name!,
          ubicacion: "${element.country} - ${element.state} - ${element.city}",
          urlDetails: "/alojamientoDetalles"));
    });
  }
}
