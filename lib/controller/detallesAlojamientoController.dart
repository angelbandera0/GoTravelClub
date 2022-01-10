import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/views/alojamiento/comun/habitacion_alojamiento.dart';
import 'package:gotravelclub/views/vuelo/local/ida.dart';
import 'package:gotravelclub/views/vuelo/local/ida_y_vuelta.dart';
import 'package:gotravelclub/views/vuelo/local/multiples_destinos.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/custom_input_age.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class DetallesAlojamientoController extends GetxController {
  int currentIndex = 0;
  int _currentDots = 0;

  CarouselController _carouselController = CarouselController();

  List<Widget> listadoHabitaciones = [];

  int get currentDots => _currentDots;
  CarouselController get carouselController=> _carouselController;

  List<String> images =["alo1.png", "alo2.png", "alo3.png"];
  late String currentImg;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentImg=images[0];
  }

  void addHabitacion(){
    listadoHabitaciones.add(HabitacionAlojamiento(index: listadoHabitaciones.length));
    update(["listadoHabitacionesAlojamiento"]);
  }
  void eliminarHabitacion(int index){
    listadoHabitaciones.removeAt(index);
    for(int i=0;i<listadoHabitaciones.length;i++){
      (listadoHabitaciones[i] as HabitacionAlojamiento).setIndex(i);
    }
    update(["listadoHabitacionesAlojamiento"]);

  }

  /*updates*/
  void updateDate(String id){
    update([id]);
  }
  void updateDots(int index){
    _currentDots=index;
    update(["dotsAlojamiento"]);
  }
  void updateById(String id){
    update([id]);
  }
  void updateBanner(int index){
    currentIndex=index;
    currentImg=images[index];
    update(["bannerAlojamiento"]);
  }

}
