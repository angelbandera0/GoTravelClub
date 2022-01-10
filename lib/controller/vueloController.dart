import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/views/vuelo/local/ida.dart';
import 'package:gotravelclub/views/vuelo/local/ida_y_vuelta.dart';
import 'package:gotravelclub/views/vuelo/local/multiples_destinos.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/custom_input_age.dart';

class VueloController extends GetxController {
  int _index = 0;

  Widget _body = IdaYVuelta();
  List<TextEditingController> _listaControllers = [];
  List<Widget> camposEdades = [];

  get index => _index;

  get body => _body;

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
  }
}
