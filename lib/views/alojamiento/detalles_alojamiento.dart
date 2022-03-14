import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/cuadroFechaController.dart';
import 'package:gotravelclub/controller/detallesAlojamientoController.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/views/alojamiento/comun/banner_alojamiento.dart';
import 'package:gotravelclub/views/alojamiento/comun/cuadro_fecha_alojamiento.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/custom_input_phone.dart';
import 'package:gotravelclub/widgets/custom_textarea.dart';
import 'package:gotravelclub/widgets/drawer.dart';
import 'package:gotravelclub/widgets/loading.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';
import 'package:html/parser.dart';

import 'comun/listado_habitaciones_alojamiento.dart';

class DetallesAlojamiento extends StatelessWidget {
  late MyDrawerController drawerController;

  DetallesAlojamiento({Key? key}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: "detallesAlojamiento",
        init: DetallesAlojamientoController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainAlojamiento());
        });
  }
}

class MainAlojamiento extends StatelessWidget {
  TextEditingController _textAreaCtrl = TextEditingController();
  TextEditingController _fullNameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: "detallesAlojamiento",
        init: DetallesAlojamientoController(),
        builder: (_) {
          return Scaffold(
              body: Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/fondo/fondo.png",
                  width: Get.width,
                  height: Get.height,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BannerAlojamiento(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _.alojamiento.name!,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "${_.alojamiento.country} / ${_.alojamiento.state} / ${_.alojamiento.city}",
                              style: TextStyle(fontSize: 11)),
                        ],
                      ),
                    ),
                    //InfoAlojamiento(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Html(
                        data: _.alojamiento.info,
                        // Styling with CSS (not real CSS)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0),
                      child: TitleWithDivider(title: "Cotización"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: CustomInput1(
                          icon: Icons.note,
                          placeholder: "Nombre",
                          isReadOnly: true,
                          textEditingController: _fullNameCtrl
                            ..text =
                                "${_.sc.getSession().first_name} ${_.sc.getSession().last_name}",
                          textInputType: TextInputType.text,
                          isPassword: false,
                          function: () {
                            _.setFullName(_fullNameCtrl.text);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: CustomInput1(
                          icon: Icons.mail,
                          placeholder: "Correo",
                          isReadOnly: true,
                          textEditingController: _emailCtrl
                            ..text = "${_.sc.getSession().email}",
                          textInputType: TextInputType.emailAddress,
                          isPassword: false,
                          function: () {
                            _.setEmail(_emailCtrl.text);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: CustomInputPhone(
                          icon: Icons.phone,
                          placeholder: "Teléfono",
                          isReadOnly: true,
                          textEditingController: _phoneCtrl
                            ..text = "${_.sc.getSession().phone}",
                          textInputType: TextInputType.phone,
                          function: () {
                            _.setPhone(_phoneCtrl.text);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: TitleWithDivider(
                        title: "Información del viaje",
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CuadroFechaAlojamiento(
                            label: "Fecha de Ida",
                            function: () {
                              _.updateDate("fechaIda");
                            },
                            width: Get.width * 0.39,
                            id: "fechaIda",
                          ),
                          CuadroFechaAlojamiento(
                            label: "Fecha de Regreso",
                            function: () {
                              _.updateDate("fechaRegreso");
                            },
                            width: Get.width * 0.39,
                            id: "fechaRegreso",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: TitleWithDivider(
                        title: "Habitaciones",
                        fontSize: 14,
                      ),
                    ),
                    ListadoHabitacionesAlojamiento(),
                    TextButton(
                        onPressed: () {
                          _.addHabitacion();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("AGREGAR HABITACIÓN",
                                style: TextStyle(
                                    color: Color(0xff621771).withOpacity(0.7),
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextArea(
                          textEditingController: _textAreaCtrl,
                          placeholder: "Observaciones",
                          readOnly: false,
                          function: () {
                            _.setObservaciones(_textAreaCtrl.text);
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButton(
                        text: "Enviar",
                        onPress: () {
                          _.cotizacion();
                        },
                        color: Color(0xff56E2C6),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              LoadingDetallesAlojamiento(),
            ],
          ));
        });
  }
}

class InfoAlojamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: "infoAlojamiento",
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _.info),
            ),
          );
        });
  }
}

class LoadingDetallesAlojamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: "loading",
        builder: (_) {
          return (_.isLoading) ? Loading() : Container();
        });
  }
}
