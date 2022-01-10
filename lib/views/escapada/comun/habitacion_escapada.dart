import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesEscapadaController.dart';
import 'package:gotravelclub/controller/habitacionEscapadaController.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_input_number.dart';

import 'ListadoEdadesMenoresEscapada.dart';

class HabitacionEscapada extends StatelessWidget {
  int index;
  String _id="habitacionEscapada";
  String _idListMenores = "ListadoEdadesMenoresEscapada";
  TextEditingController _cantMenoresCtrl = TextEditingController();
  late HabitacionEscapadaController habitacionController;

  HabitacionEscapada({Key? key, required this.index}) : super(key: key){
    Get.create(() => HabitacionEscapadaController());
    habitacionController = Get.find<HabitacionEscapadaController>();
  }

  void setIndex(index)=>this.index=index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesEscapadaController>(
        id: _id,
        builder: (_) {
      return Container(
        width: Get.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Habitacion #${this.index+1}",style: TextStyle(fontWeight: FontWeight.bold),),
                TextButton(onPressed: (){
                  _.eliminarHabitacion(this.index);
                }, child: Text("Eliminar",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),))
              ],
            ),
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
                        textEditingController: TextEditingController(),
                        textInputType: TextInputType.number,
                        function: () {})),
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
                          habitacionController.listadoCamposEdadMenores(
                              _idListMenores+this.index.toString(), _cantMenoresCtrl.text);
                        })),
              ],
            ),
            TitleWithDivider(
              title: "Edades de los menores",
              fontSize: 14,
            ),
            ListadoEdadesMenoresEscapada(id: _idListMenores+index.toString(), habitacionController: habitacionController,)
          ],
        ),
      );});
  }
}
