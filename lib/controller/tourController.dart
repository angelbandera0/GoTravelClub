import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/helper/notification.dart';
import 'package:gotravelclub/models/request/tour.dart';
import 'package:gotravelclub/models/response/tourResponse.dart';
import 'package:gotravelclub/services/tour_service.dart';
import 'package:gotravelclub/views/custom/cuadro_corto.dart';
import 'package:gotravelclub/views/custom/cuadro_largo.dart';

class TourController extends GetxController {
  TourService tourService =
  TourService(DioClient().init());
  late Notificacion _notificacion;
  int page=0;
  List<Tour> populares = [];
  List<Tour> tours_list = [];
  List<Widget> w_populares = [];
  List<Widget> w_tours = [];
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
    getTours();
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

  void getTours() async {
    TourResponse tourResponse =
        await tourService.getTours(page);
    populares = tourResponse.popular!;
    tours_list = tourResponse.data!;
    end=tourResponse.end!;
   // print("object");
    createListCortos();
    createListLargos();
    isShimmer=false;
    update(["listaTour","popularesTour"]);
  }

  void createListCortos() {
    populares.forEach((element) {
      w_populares.add(CuadroCorto(
          url: element.imagen1!,
          nombre: element.name!,
          ubicacion: "${element.country} - ${element.state} - ${element.city}",
          urlDetails: "/tourDetalles",
        object: element,
      ));
    });
  }

  void createListLargos() {
    w_tours=[];
    tours_list.forEach((element) {
      w_tours.add(CuadroLargo(
          url: element.imagen1!,
          nombre: element.name!,
          ubicacion: "${element.country} - ${element.state} - ${element.city}",
          urlDetails: "/tourDetalles",
        object: element,
      ));
    });
  }

  void loadMore() async{
    if(!end) {
      toggleLoading();
      page++;
      TourResponse tourResponse = await tourService
          .getTours(page);
      List<Tour> aux = List.from(tours_list)
        ..addAll(tourResponse.data!);
      tours_list = aux;
      print(tours_list.length);
      createListLargos();
      update(["listaTour"]);
      toggleLoading();
    }
    else{
      _notificacion.notificar(body: "No hay más tours por cargar", type: "error");
    }
  }

  void search(String s) async{
    toggleLoading();
    if(s!="") {
      TourResponse tourResponse= await tourService.findTours(s);
      tours_list = tourResponse.data!;
      createListLargos();
      toggleLoading();
      update(["listaTour"]);
    }else{
      toggleLoading();
      getTours();
    }

    }
}
