import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/widgets/custom_input_age.dart';

import 'detallesTourController.dart';

class HabitacionTourController extends GetxController {
  List<TextEditingController> _listaControllers = [];
  List<Widget> camposEdades = [];
  late DetallesTourController dac;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dac=Get.find<DetallesTourController>();
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
    dac.update([id]);
  }

  /*clear*/
  void _clear(){
    camposEdades = [];
    _listaControllers = [];
  }
}