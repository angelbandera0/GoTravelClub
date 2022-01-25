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
  VueloService _vueloService = VueloService(DioClient().init());
  List<Airport> listadoAirportsIda = [];
  List<Airport> listadoAirportsVuelta = [];
  bool isLoadingDrop = false;
  List<String> items = [];
  int _index = 0;
  String aeropuertoIda = "";
  String aeropuertoVuelta = "";
  Widget _body = IdaYVuelta();
  List<TextEditingController> _listaControllers = [];
  late SessionController sc = SessionController();
  late Notificacion _notificacion = Notificacion();


  List<Widget> camposEdades = [];
  late String dateBegining = "";
  late String dateEnd = "";
  late String clase = "Economico";
  late String cantAdultos = "";
  late bool _isLoading = false;

  get isLoading => _isLoading;

  get index => _index;

  get body => _body;

  setDateBegining(String date) => dateBegining = date;

  setDateEnd(String date) => dateEnd = date;

  setClase(String c) => clase = c;

  setCantAdultos(String c) => cantAdultos = c;

  setAeropuertoIda(String s) => aeropuertoIda = s;

  setAeropuertoVuelta(String s) => aeropuertoVuelta = s;

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
    aeropuertoIda = "";
    aeropuertoVuelta = "";
    dateBegining = "";
    dateEnd = "";
    clase = "Economico";
    cantAdultos = "";
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

  void updateDate(String id) {
    update([id]);
  }

  void _clear() {
    camposEdades = [];
    _listaControllers = [];
  }

  Future<List<Airport>> getAirports(String s) async {
    AirportResponse response = await _vueloService.getAirports(s);
    print(response.result);
    return response.result!;
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    update(["loading"]);
  }

  void sendCotizacion(String id) async {
    if (validarDatos(id)) {
      toggleLoading();
      Map<String, dynamic> map = initMapData(
          (id == "idavuelta") ? "out" : "in");
      QuoteResponse response = await _vueloService.sendCuota(map);
      print(response.toJson());
      if (response.state) {
        _notificacion.notificar(
            body: "Su cotización ha sido enviada exitosamente en breve uno de nuestros asesores le hará llegar la información solicitada.",
            type: "success");
        toggleLoading();
      }
      else {
        _notificacion.notificar(
            body: "Ha ocurrido un error al enviar los datos.", type: "error");
        toggleLoading();
      }
    }
  }

  Map<String, dynamic> initMapData(String type) {
    var map = new Map<String, dynamic>();
    map['type'] = type;
    map['cedula'] = sc
        .getSession()
        .cedula
        .toString();
    map['registration_id'] = "";
    map['airportorigen'] = aeropuertoIda;
    map['airportdestiny'] = (type == "out") ? aeropuertoVuelta : "";
    map['date_begin'] = dateBegining;
    map['date_end'] = (type == "out") ? dateEnd : "";
    map['count_adults'] = "${cantAdultos}";
    map['clase'] = clase;
    List<int> list = [];
    _listaControllers.forEach((element) {
      list.add(int.parse(element.text));
    });
    map['lst_edades'] = jsonEncode(list);
    print(map);
    return map;
  }

  bool validarDatos(String id) {
    if (aeropuertoIda == "") {
      _notificacion.notificar(
          body: "Debe especificar el aeropuerto de ida.", type: "error");
      return false;
    }
    if (dateBegining == "") {
      _notificacion.notificar(
          body: "Debe especificar la fecha de ida.", type: "error");
      return false;
    }
    if (id == "idavuelta") {
      if (aeropuertoVuelta == "") {
        _notificacion.notificar(
            body: "Debe especificar el aeropuerto de regreso.", type: "error");
        return false;
      }
      if (dateEnd == "") {
        _notificacion.notificar(
            body: "Debe especificar la fecha de regreso.", type: "error");
        return false;
      }
      var d1 = dateBegining.split("-");
      var d2 = dateEnd.split("-");
      var a = DateTime.utc(
          int.parse(d1[2]), int.parse(d1[1]), int.parse(d1[0]));
      var b = DateTime.utc(
          int.parse(d2[2]), int.parse(d2[1]), int.parse(d2[0]));
      if (b.compareTo(a) != 1) {
        _notificacion.notificar(
            body: "La fecha de ida debe ser menor que la de regreso.",
            type: "error");
        return false;
      }
    }
      if (cantAdultos == "" || cantAdultos == "0") {
        _notificacion.notificar(
            body: "Debe agregar al menos a un adulto.", type: "error");
        return false;
      }
      for (int i = 0; i < _listaControllers.length; i++) {
        TextEditingController element = _listaControllers[i];
        if (element.text == "" || element.text == null) {
          _notificacion.notificar(
              body: "Debe rellenar los campos de las edades.", type: "error");
          return false;
        }
      }

      return true;
    }
  }

