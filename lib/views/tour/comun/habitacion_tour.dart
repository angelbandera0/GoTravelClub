import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesTourController.dart';
import 'package:gotravelclub/controller/habitacionController.dart';
import 'package:gotravelclub/controller/habitacionTourController.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_input_number.dart';

import 'ListadoEdadesMenoresTour.dart';

class HabitacionTour extends StatelessWidget {
  int index;
  String _id = "habitacionTour";
  String _idListMenores = "ListadoEdadesMenoresTour";
  TextEditingController _cantAdultosCtrl = TextEditingController();
  TextEditingController _cantMenoresCtrl = TextEditingController();
  late HabitacionTourController habitacionTourController;

  HabitacionTour({Key? key, required this.index}) : super(key: key) {
    Get.create(() => HabitacionTourController());
    habitacionTourController = Get.find<HabitacionTourController>();
  }

  void setIndex(index) => this.index = index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesTourController>(
        id: _id,
        builder: (_) {
          habitacionTourController.setIndexH(this.index);
          return Container(
            width: Get.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Habitacion #${this.index + 1}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          _.eliminarHabitacion(this.index);
                        },
                        child: Text(
                          "Eliminar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ))
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
                            textEditingController: _cantAdultosCtrl,
                            textInputType: TextInputType.number,
                            function: () {
                              _.setCantidadAdultos(
                                  this.index, _cantAdultosCtrl.text);
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
                              _.setCantidadMenores(
                                  this.index, _cantMenoresCtrl.text);
                              habitacionTourController.listadoCamposEdadMenores(
                                  _idListMenores + this.index.toString(),
                                  _cantMenoresCtrl.text);
                            })),
                  ],
                ),
                TitleWithDivider(
                  title: "Edades de los menores",
                  fontSize: 14,
                ),
                ListadoEdadesMenoresTour(
                  id: _idListMenores + this.index.toString(),
                  habitacionTourController: habitacionTourController,
                )
              ],
            ),
          );
        });
  }
}
