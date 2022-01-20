import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/sessionController.dart';
import 'package:gotravelclub/helper/notification.dart';
import 'package:gotravelclub/models/response/airportResponse.dart';
import 'package:gotravelclub/models/response/quoteResponse.dart';
import 'package:gotravelclub/services/vueloService.dart';
import 'package:gotravelclub/views/vuelo/local/ida.dart';
import 'package:gotravelclub/views/vuelo/local/ida_y_vuelta.dart';
import 'package:gotravelclub/views/vuelo/local/multiples_destinos.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/widgets/custom_input_age.dart';

class VueloController extends GetxController {
  VueloService _vueloService=VueloService(DioClient().init());
  List<Airport> listadoAirports=[];
  bool isLoadingDrop=false;
  List<String> items =[];
  int _index = 0;
  String aeropuertoIda="Pulse para escoger aeropuerto";
  String aeropuertoIdaLabel="";
  String aeropuertoVuelta="Pulse para escoger aeropuerto";
  String aeropuertoVueltaLabel="";
  Widget _body = IdaYVuelta();
  List<TextEditingController> _listaControllers = [];
  late SessionController sc=SessionController();
  late Notificacion _notificacion=Notificacion();


  List<Widget> camposEdades = [];
  late String dateBegining="";
  late String dateEnd="";
  late String clase="";
  late String cantAdultos="";
  late bool _isLoading=false;

  get isLoading => _isLoading;
  get index => _index;

  get body => _body;

  setDateBegining(String date) => dateBegining = date;
  setDateEnd(String date) => dateEnd = date;
  setClase(String c) => clase = c;
  setCantAdultos(String c) => cantAdultos = c;

  void cambiarTab(int index) {
    _index = index;
    switch (index) {
      case 0:
        {
          _body = IdaYVuelta();
          break;
        }
      case 1:
        {
          _body = Ida();
          break;
        }

    }

    _clear();
    update(["vuelo"]);
  }

  void listadoCamposEdadMenores(String id, String cantidadMenores) {
   _clear();
    if (cantidadMenores != "") {
      print("object");
      for (int i = 0; i < int.parse(cantidadMenores); i++) {
        TextEditingController tec = TextEditingController();

        Widget tf = Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Menor ${i + 1}"),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: Get.width * 0.20,
                  child: CustomInputAge(
                    function: () {
                      print(_listaControllers[i].text);
                    },
                    textInputType: TextInputType.number,
                    textEditingController: tec,
                  )),
            ],
          ),
        );
        _listaControllers.add(tec);
        camposEdades.add(tf);
      }
    }
print(id);
    update([id]);
  }
  void updateDate(String id){
    update([id]);
  }
  void _clear(){
    camposEdades = [];
    _listaControllers = [];
    aeropuertoIda="Pulse para escoger aeropuerto";
    aeropuertoIdaLabel="";
    aeropuertoVuelta="Pulse para escoger aeropuerto";
    aeropuertoVueltaLabel="";
    dateBegining="";
    dateEnd="";
    clase="";
    cantAdultos="";
  }

  void getAirports(String s) async{
    isLoadingDrop=true;

    AirportResponse response=await _vueloService.getAirports(s);
    listadoAirports=response.result!;
    items=[];
    listadoAirports.forEach((element) { 
      items.add(element.name!);
    });
    isLoadingDrop=false;
    print(listadoAirports.length);
  }
  void setNameAirport(String id,String value){
    print(id);
    print(value);
    Airport a=new Airport();
    listadoAirports.forEach((element) {
      if (element.name==value) {
        print("found!!!!!!!!!");
        a=element;
      }
    });
    if(id=="airportIdaIV" || id=="airportIdaI"){
      aeropuertoIda=a.name!;
      aeropuertoIdaLabel=a.country!;
    }
    else if(id=="airportVueltaIV"){
      aeropuertoVuelta=a!.name!;
      aeropuertoVueltaLabel=a!.country!;
    }
    update([id]);
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    update(["loading"]);
  }

  void sendCotizacion(String id) async{
    toggleLoading();

    Map<String, dynamic> map=initMapData((id=="idavuelta")?"out":"in");
    QuoteResponse response=await _vueloService.sendCuota(map);
    print(response.toJson());
    if (response.state) {
      _notificacion.notificar(
          body: "Se ha enviado la cotizacion del vuelo correctamente de alojamiento correctamente.",
          type: "success");
      toggleLoading();
    }
    else {
      _notificacion.notificar(
          body: "Ha ocurrido un error al enviar los datos.", type: "error");
      toggleLoading();
    }

  }
  Map<String, dynamic> initMapData(String type) {
    var map = new Map<String, dynamic>();
    map['type'] = type;
    map['cedula'] = sc.getSession().cedula.toString();
    map['registration_id'] = "";
    map['airportorigen'] = aeropuertoIda;
    map['airportdestiny'] = (type=="out")?aeropuertoVuelta:"";
    map['date_begin'] = dateBegining;
    map['date_end'] = (type=="out")?dateEnd:"";
    map['count_adults'] = "${cantAdultos}\n";
    map['clase'] = clase;
    List<int> list = [];
    _listaControllers.forEach((element) {
      list.add(int.parse(element.text));
    });
    map['lst_edades'] = jsonEncode(list);
    print(map);
    return map;
  }
}
