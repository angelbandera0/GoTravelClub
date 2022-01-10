import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/cuadroFechaController.dart';
import 'package:gotravelclub/controller/vueloController.dart';
import 'package:intl/intl.dart';

class CuadroFecha extends StatelessWidget {
  final String id;
  final String label;
  final Function function;
  final double width;
  String fecha = "---- -- --";
  late CuadroFechaController cuadroFechaController;

  CuadroFecha(
      {Key? key,
      required this.label,
      required this.function,
      required this.width,
      required this.id})
      : super(key: key) {
    Get.create(() => CuadroFechaController());
    cuadroFechaController = Get.find<CuadroFechaController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: id,
        builder: (controller) {
          return Material(
            elevation: 6,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: new Center(
              child: new Ink(
                width: this.width,
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: new InkWell(
                  splashColor: Color(0xff611771).withOpacity(0.5),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      print('confirm $date');
                      fecha = DateFormat.yMd().format(date);
                      print(fecha);
                      cuadroFechaController.setFecha(fecha);
                      this.function();
                    }, currentTime: DateTime.now(), locale: LocaleType.es);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(label,
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      Text(
                        cuadroFechaController.fecha,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
