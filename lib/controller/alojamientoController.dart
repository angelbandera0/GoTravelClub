import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/helper/notification.dart';
import 'package:gotravelclub/models/request/alojamiento.dart';
import 'package:gotravelclub/models/response/alojamientoResponse.dart';
import 'package:gotravelclub/services/alojamiento_service.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';
import 'package:gotravelclub/views/custom/cuadro_corto.dart';
import 'package:gotravelclub/views/custom/cuadro_largo.dart';
import 'package:url_launcher/url_launcher.dart';

class AlojamientoController extends GetxController {
  AlojamientoService alojamientoService =
      AlojamientoService(DioClient().init());
  late Notificacion _notificacion;
  int page=0;
  bool isInSearch=false;
  List<Alojamiento> populares = [];
  List<Alojamiento> alojamientos_list = [];
  List<Widget> w_populares = [];
  List<Widget> w_alojamientos = [];
  bool isShimmer=true;
  late bool _isLoading;
  late bool end;

  get isLoading => _isLoading;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isLoading=false;
    end=false;
    _notificacion = new Notificacion();
    getAlojamientos();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
   // print("axsdxs");
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    update(["loading","loadingAppBar"]);
  }

  void getAlojamientos() async {
    AlojamientoResponse alojamientoResponse =
        await alojamientoService.getAlojamientos(page);
    populares = alojamientoResponse.popular!;
    alojamientos_list = alojamientoResponse.data!;
    end=alojamientoResponse.end!;
    if(alojamientoResponse.config!.out!){
      Get.offNamed("/mantenimiento");
    }
    var a=PreferenceUtils.getString("versionApp",alojamientoResponse.config!.versionApk!);
    print(a);
    print(alojamientoResponse.config!.versionApk!);
    if(a!=alojamientoResponse.config!.versionApk!){
      Get.defaultDialog(
        title: "Mensage de notificación",
        middleText: "Hay una nueva versión de la aplicación.¿Desea descargarla de nuestro sitio web?",
        backgroundColor: Colors.white,
        textConfirm: "Confirmar",
        textCancel: "Cancelar",
        cancelTextColor: Color(0xff56E2C6),
        confirmTextColor: Colors.white,
        buttonColor: Color(0xff56E2C6),
        onConfirm: () {
          _launchURL();
          Navigator.pop(Get.context!);

        },
        titleStyle: TextStyle(color: Colors.black54),
        middleTextStyle: TextStyle(color: Colors.black54),
      );
    }
   // print("object");
    createListCortos();
    createListLargos();
    isShimmer=false;
    update(["listaAlojamiento","popularesAlojamiento"]);
  }
  _launchURL() async {
    var url = "https://www.gotravelclub.com.ec/#target-aplicacion";
    if (!await launch(url)) throw 'Could not launch $url';
  }
  void createListCortos() {
    w_populares=[];
    populares.forEach((element) {
      w_populares.add(CuadroCorto(
          url: element.imagen1!,
          nombre: element.name!,
          ubicacion: "${element.country} - ${element.state} - ${element.city}",
          urlDetails: "/alojamientoDetalles",
        object: element,
      ));
    });
  }

  void createListLargos() {
    w_alojamientos=[];
    alojamientos_list.forEach((element) {
      w_alojamientos.add(CuadroLargo(
          url: element.imagen1!,
          nombre: element.name!,
          ubicacion: "${element.country} - ${element.state} - ${element.city}",
          urlDetails: "/alojamientoDetalles",
        object: element,
      ));
    });
  }

  void loadMore() async{
    if(!end) {
      toggleLoading();
      page++;
      AlojamientoResponse alojamientoResponse = await alojamientoService
          .getAlojamientos(page);
      List<Alojamiento> aux = List.from(alojamientos_list)
        ..addAll(alojamientoResponse.data!);
      alojamientos_list = aux;
      print(alojamientos_list.length);
      createListLargos();
      update(["listaAlojamiento"]);
      toggleLoading();
    }
    else{
      _notificacion.notificar(body: "No hay más alojamientos por cargar", type: "error");
    }
  }

  void search(String s) async{
    toggleLoading();
    if(s!="") {
      isInSearch=true;
      AlojamientoResponse alojamientoResponse= await alojamientoService.findAlojamientos(s);
      print(alojamientoResponse.data!.length);
      alojamientos_list = alojamientoResponse.data!;
      createListLargos();
      toggleLoading();
      update(["listaAlojamiento","titlePopularesAlojamiento","ButtomLoadMoreAlojamiento","popularesAlojamiento"]);
    }else{
      toggleLoading();
      isInSearch=false;
      getAlojamientos();
      update(["titlePopularesAlojamiento","ButtomLoadMoreAlojamiento","popularesAlojamiento"]);
    }

    }
}
