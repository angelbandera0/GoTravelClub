// ignore: file_names
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/src/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/sessionController.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/helper/notification.dart';
import 'package:gotravelclub/models/habitacion/habitacion.dart';
import 'package:gotravelclub/models/request/tour.dart';
import 'package:gotravelclub/models/response/quoteResponse.dart';
import 'package:gotravelclub/services/tour_service.dart';
import 'package:gotravelclub/views/custom/textDetallesInfo.dart';
import 'package:gotravelclub/views/tour/comun/habitacion_tour.dart';
import 'package:html/parser.dart';

class DetallesTourController extends GetxController {
  TourService tourService =
  TourService(DioClient().init());
  int currentIndex = 0;
  int _currentDots = 0;
  late String observaciones = "";
  late String fullname = "";
  late String email = "";
  late String phone = "";
  late String dateBegining="";
  late String dateEnd="";
  late Notificacion _notificacion;
  Tour tour = Get.arguments;
  late SessionController sc;
  CarouselController _carouselController = CarouselController();
  List<Widget> listadoHabitaciones = [];
  List<Widget> info = [];
  List<Habitacion> listadoHabitacionesDatos = [];
  late bool _isLoading;

  get isLoading => _isLoading;

  int get currentDots => _currentDots;

  CarouselController get carouselController => _carouselController;

  late String currentImg;

  setFullName(String s) => fullname = s;

  setEmail(String s) => email = s;

  setPhone(String s) => phone = s;

  setDateBegining(String date) => dateBegining = date;

  setDateEnd(String date) => dateEnd = date;

  setObservaciones(String s) => observaciones = s;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isLoading = false;
    _notificacion = new Notificacion();
    currentImg = tour.imagen1!;
    loadInfo();
    sc = Get.find<SessionController>();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    update(["loading"]);
  }

  void addHabitacion() {
    listadoHabitaciones
        .add(HabitacionTour(index: listadoHabitaciones.length));
    listadoHabitacionesDatos.add(Habitacion());
    update(["listadoHabitacionesTour"]);
  }

  void eliminarHabitacion(int index) {
    listadoHabitaciones.removeAt(index);
    listadoHabitacionesDatos.removeAt(index);
    for (int i = 0; i < listadoHabitaciones.length; i++) {
      (listadoHabitaciones[i] as HabitacionTour).setIndex(i);
    }
    update(["listadoHabitacionesTour"]);
  }

  void loadInfo() {
    print(parse(tour.info).getElementsByTagName("p"));
    parse(tour.info).getElementsByTagName("p").forEach((element) {
      print(element.getElementsByTagName("span"));
      info.add(TextDetallesInfo(
          text: element.getElementsByTagName("span").toString()));
    });
    update(["infoTour"]);
  }

  /*updates*/
  void updateDate(String id) {
    update([id]);
  }

  void updateDots(int index) {
    _currentDots = index;
    update(["dotsTour"]);
  }

  void updateById(String id) {
    update([id]);
  }

  void updateBanner(int index) {
    currentIndex = index;
    currentImg = tour.toJson()["imagen${index + 1}"];
    update(["bannerTour"]);
  }

  setCantidadAdultos(int index, String cant) {
    if(cant!=""){
      listadoHabitacionesDatos[index].count_adults = int.parse(cant);
    }
  }

  setCantidadMenores(int index, String cant) {
    if(cant!=""){
      List<int> a = List.filled(int.parse(cant), -1);
      listadoHabitacionesDatos[index].ages_minors = a;
    }

  }

  addEdad(int indexH, int indexE, String edad) {
    if(edad!=""){
      listadoHabitacionesDatos[indexH].ages_minors![indexE] = int.parse(edad);
    }

  }

  void cotizacion() async {
    try {
      toggleLoading();
      if(validarCampos()) {
        QuoteResponse response = await tourService.sendCuota(
            initMapData());
        if (response.state) {
          _notificacion.notificar(
              body: "Se ha enviado la cuota del tour correctamente.",
              type: "success");
          toggleLoading();
        }
        else {
          _notificacion.notificar(
              body: "Ha ocurrido un error al enviar los datos.", type: "error");
          toggleLoading();
        }
      }
      else{
        toggleLoading();
      }
    } catch (e) {
      _notificacion.notificar(body: "Ha ocurrido un error.", type: "error");
      toggleLoading();
    }
  }

  Map<String, dynamic> initMapData() {
    var map = new Map<String, dynamic>();
    map['pk'] = tour.pk.toString();
    map['cedula'] = sc.getSession().cedula.toString();
    map['registration_id'] = "";
    map['fullname'] = fullname;
    map['email'] = email;
    map['phone'] = phone;
    map['dateBeginning'] = dateBegining;
    map['dateEnd'] = dateEnd;
    map['comments'] = observaciones;
    List<dynamic> list = [];
    listadoHabitacionesDatos.forEach((element) {
      list.add(element.toJson());
    });
    map['dataRooms'] = jsonEncode(list);
    print(map);
    return map;
  }

  bool validarCampos(){
    if(fullname=="" || fullname==null){
      _notificacion.notificar(
          body: "El campo del nombre se encuentra vacío.", type: "error");
      return false;
    }
    if(email=="" || email==null){
      _notificacion.notificar(
          body: "El campo del correo se encuentra vacío.", type: "error");
      return false;
    }
    if(!EmailValidator.validate(email)){
      _notificacion.notificar(
          body: "El email insertado no es válido.", type: "error");
      return false;
    }
    if(phone=="" || phone==null){
      _notificacion.notificar(
          body: "El campo del teléfono se encuentra vacío.", type: "error");
      return false;
    }
    if(dateBegining=="" || dateEnd==""){
      _notificacion.notificar(
          body: "Se debe insertar una fecha válida.", type: "error");
      return false;
    }
    if(listadoHabitacionesDatos.length==0){
      _notificacion.notificar(
          body: "Debe agregar al menos una habitación.", type: "error");
      return false;
    }
    if(!validarDatosHabitacion()){
      _notificacion.notificar(
          body: "Existen campos dentro de las habitaciones sin llenar.", type: "error");
      return false;
    }
    return true;
  }

  bool validarDatosHabitacion(){
    for(int i=0;i<listadoHabitacionesDatos.length;i++){
      Habitacion element=listadoHabitacionesDatos[i];
      if(element.count_adults==0 || element.count_adults==null){
        return false;
      }
      else{
        if(element.ages_minors!.length==0){
          return false;
        }
        else {
          for (int j = 0; j < element.ages_minors!.length; j++){
            if(element.ages_minors![j]==-1 || element.ages_minors![j]== 0 || element.ages_minors![j]== null){

              return false;
            }
          }
        }
        }

    }

    return true;
  }
}
