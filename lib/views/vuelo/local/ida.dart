import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/vueloController.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/views/vuelo/comun/cuadro_fecha.dart';
import 'package:gotravelclub/views/vuelo/comun/dropDown.dart';
import 'package:gotravelclub/views/vuelo/comun/listado_edades_menores.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input_number.dart';

class Ida extends StatelessWidget {
  TextEditingController _adultosCtrl = TextEditingController();
  TextEditingController _cantMenoresCtrl = TextEditingController();
  String _id="ida";
  String _idListMenores = "ListadoEdadesMenoresIda";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: _id,
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleWithDivider(title: "Información del Vuelo"),
              //destinos de aeropuertos
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: DropDown(id: "idaI", label: "Aeropuerto de Ida", rotation: 1, function: _.setAeropuertoIda),
              ),
              SizedBox(
                height: 20,
              ),
              //Fechas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Fecha de ida
                    CuadroFecha(
                      label: "Fecha de Ida",
                      function: () {
                        _.updateDate("fechaIda");
                      },
                      width: Get.width * 0.80,
                      id: "fechaIda",
                    ),
                    //Fecha de Regreso

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Pasajeros
              TitleWithDivider(title: "Pasajeros"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Adultos",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text("Cantidad de adultos",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300)),
                          ]),
                      Container(
                          width: Get.width * 0.4,
                          padding: EdgeInsets.only(top: 10, right: 5),
                          child: CustomInputNumber(
                              icon: Icons.people_outlined,
                              placeholder: "",
                              textEditingController: _adultosCtrl,
                              textInputType: TextInputType.number,
                              function: () {
                                _.setCantAdultos(_adultosCtrl.text);
                              })),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Menores",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text("Cantidad de menores",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300)),
                          ]),
                      Container(
                          width: Get.width * 0.4,
                          padding: EdgeInsets.only(top: 10, right: 5),
                          child: CustomInputNumber(
                              icon: Icons.people_outlined,
                              placeholder: "",
                              textEditingController: _cantMenoresCtrl,
                              textInputType: TextInputType.number,
                              function: () {
                                print(_cantMenoresCtrl.text);
                                _.listadoCamposEdadMenores(
                                    _idListMenores, _cantMenoresCtrl.text);
                              })),
                    ],
                  ),
                  TitleWithDivider(
                    title: "Edades de los menores",
                    fontSize: 14,
                  ),
                  ListadoEdadesMenores(id: _idListMenores),
                ],
              ),
              //Clase
              TitleWithDivider(title: "Clase"),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3),
                child: Material(
                  elevation: 4,
                  child: DropdownSearch<String>(
                    mode: Mode.BOTTOM_SHEET,
                    items: [
                      "Economico",
                      "Primera Clase",
                      'Premiun',
                      "Bussiness"
                    ],
                    hint: "Selecciona la clase a viajar.",
                    onChanged: (value){
                      _.setClase(value!);
                    },
                    dropdownSearchDecoration: InputDecoration(
                      label: Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text("Clase"),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                        const BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    selectedItem: "Economico",
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                text: "Enviar",
                onPress: () {
                  _.sendCotizacion(_id);
                },
                color: Color(0xff56E2C6),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }
}
