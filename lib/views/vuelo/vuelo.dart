import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/vueloController.dart';
import 'package:gotravelclub/helper/link_router_bottom_bar.dart';
import 'package:gotravelclub/views/custom/cuadro_corto.dart';
import 'package:gotravelclub/views/custom/cuadro_largo.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/views/vuelo/local/ida_y_vuelta.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/custom_input_number.dart';
import 'package:gotravelclub/widgets/option.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Vuelo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: "vuelo",
        init: VueloController(),
        builder: (_) {
          return Scaffold(
            appBar: PreferredSize(
              child: Container(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 35, 20, 0),

                  //color: Colors.blue,

                  child: Column(
                    children: [
                      AppBarr(),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleSwitch(
                        initialLabelIndex: _.index,
                        minWidth: 150,
                        minHeight: 50.0,
                        cornerRadius: 30.0,
                        activeBgColor: [Color(0xff621771)],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Color(0xffb8b3b2),
                        inactiveFgColor: Colors.grey[900],
                        totalSwitches: 2,
                        labels: ['Ida y Vuelta', 'Solo Ida'],
                        onToggle: (index) {
                          print('switched to: $index');
                          _.cambiarTab(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              preferredSize: Size(Get.width, 136),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: _.body,
              ),
            ),
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Color(0xff621771),
              items: [
                TabItem(icon: Icons.home, title: 'Alojamientos'),
                TabItem(icon: Icons.public, title: 'Tours'),
                TabItem(icon: Icons.place, title: 'Escapadas'),
                TabItem(icon: Icons.flight, title: 'Vuelos'),
              ],
              initialActiveIndex: 3, //optional, default as 0
              onTap: (int i) {
                LinkRouterBottomBar(i).link();
              },
            ),
          );
        });
  }
}
