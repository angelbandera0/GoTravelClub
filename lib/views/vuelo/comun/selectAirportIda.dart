import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/vueloController.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'dropDown.dart';

class SelectAirportIda extends StatelessWidget {
  TextEditingController _airportIdaCtrl = TextEditingController();
  final String id;
  final double width;

  SelectAirportIda({Key? key, required this.id, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: this.id,
        init: VueloController(),
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            width: this.width,
            child: GestureDetector(
              onTap: () {
                showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      controller:
                      ModalScrollController.of(context),
                      physics: BouncingScrollPhysics(),

                      child: Container(
                        height: Get.height * 0.5,
                        width: Get.width,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget>[
                                CustomInput(
                                    icon: Icons.search,
                                    placeholder:
                                    "Buscar aeropuerto",
                                    textEditingController: _airportIdaCtrl,
                                    textInputType:
                                    TextInputType.text,
                                    isPassword: false,
                                    function: () {
                                      EasyDebounce.debounce(
                                          this.id,                 // <-- An ID for this particular debouncer
                                          Duration(milliseconds: 1000),    // <-- The debounce duration
                                              () => _.getAirports(_airportIdaCtrl.text)
                                      );
                                    }),
                                DropDown(id:(id))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_.aeropuertoIdaLabel,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  AutoSizeText(_.aeropuertoIda,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300)),
                ],
              ),
            ),
          );
        });
  }
}

