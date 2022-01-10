import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/views/tour/comun/habitacion_tour.dart';
class DetallesTourController extends GetxController {
  int currentIndex = 0;
  int _currentDots = 0;

  CarouselController _carouselController = CarouselController();

  List<Widget> listadoHabitaciones = [];

  int get currentDots => _currentDots;
  CarouselController get carouselController=> _carouselController;

  List<String> images =["tour1.png", "tour2.png", "tour3.png"];
  late String currentImg;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentImg=images[0];
  }

  void addHabitacion(){
    listadoHabitaciones.add(HabitacionTour(index: listadoHabitaciones.length));
    update(["listadoHabitacionesTour"]);
  }
  void eliminarHabitacion(int index){
    listadoHabitaciones.removeAt(index);
    for(int i=0;i<listadoHabitaciones.length;i++){
      (listadoHabitaciones[i] as HabitacionTour).setIndex(i);
    }
    update(["listadoHabitacionesTour"]);

  }

  /*updates*/
  void updateDate(String id){
    update([id]);
  }
  void updateDots(int index){
    _currentDots=index;
    update(["dotsTour"]);
  }
  void updateById(String id){
    update([id]);
  }
  void updateBanner(int index){
    currentIndex=index;
    currentImg=images[index];
    update(["bannerTour"]);
  }

}
