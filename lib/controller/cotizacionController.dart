import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/models/response/cotizacionResponse.dart';
import 'package:gotravelclub/services/cotizacion_service.dart';
import 'package:gotravelclub/views/listado_cotizacion/card_cotizacion.dart';

class CotizacionController extends GetxController{
  CotizacionService cotizacionService =  CotizacionService(DioClient().init());
  List<Widget> listadoCotizacionWidget=[];
  List<Info> listInfo=[];
  late bool _isLoading;

  get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isLoading=false;
    getAllCotizacions();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    update(["loading"]);
  }

  void getAllCotizacions()async{
    toggleLoading();

    CotizacionResponse cotizacionResponse= await cotizacionService.getCotizacion();
    listInfo=cotizacionResponse.info!;
    print(listInfo.length);

    buildListCotizaciones();
    Color c=Colors.transparent;
    String title="";
    late IconData icon;
    listInfo.forEach((element) {
      if(element.type==1){
        c=Color(0xff621771);
        title="Alojamiento";
        icon=Icons.home;
      }
      else if(element.type==2){
        c=Colors.pinkAccent;
        title="Tour";
        icon=Icons.public;

      }
      /*if(element.type==4){
        c=Colors.indigo;
        title="Vuelo";
        icon=Icons.flight;

      }*/
      listadoCotizacionWidget.add(CardCotizacion(color: c, title: "${title} (${element.title})", icon: icon,info:element));
    });
    update(["listadoCotizaciones"]);
    toggleLoading();

  }

  void buildListCotizaciones(){


  }
}