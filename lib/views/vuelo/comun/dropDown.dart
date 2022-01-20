import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/vueloController.dart';

class DropDown extends StatelessWidget {
  final String id;

  DropDown({Key? key, required this.id, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: this.id, builder: (_) {
          return DropdownSearch<String>(
            mode: Mode.BOTTOM_SHEET,
            items: _.items,
            label: "Seleccione el aeropuerto",
            hint:
            "Seleccione el aeropuerto a viajar.",
            onChanged: (value){
          _.setNameAirport(this.id, value!);
            } ,

          );
        });
  }
}