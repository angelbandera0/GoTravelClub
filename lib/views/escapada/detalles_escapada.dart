import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesEscapadaController.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/custom_input_phone.dart';
import 'package:gotravelclub/widgets/custom_textarea.dart';
import 'package:gotravelclub/widgets/drawer.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';

import 'comun/banner_escapada.dart';
import 'comun/cuadro_fecha_escapada.dart';
import 'comun/listado_habitaciones_escapada.dart';

class DetallesEscapada extends StatelessWidget {
  late MyDrawerController drawerController;

  DetallesEscapada({Key? key}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesEscapadaController>(
        id: "detallesEscapada",
        init: DetallesEscapadaController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainEscapada());
        });
  }
}

class MainEscapada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesEscapadaController>(
        id: "detallesEscapada",
        init: DetallesEscapadaController(),
        builder: (_) {
          return Scaffold(
              body: Stack(
                children: [
                  ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: Get.height,fit: BoxFit.cover,),),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        BannerEscapada(),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hotel Cuenca",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text("Ecuador / Chimborazo / Riobamba",
                                  style: TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "El Hotel La Primavera se encuentra en Riobamba y ofrece jardín y zona de barbacoa. El establecimiento cuenta con restaurante, recepción 24 horas, servicio de habitaciones y WiFi gratuita en todas las instalaciones. Se ofrece aparcamiento privado por un suplemento.",
                                      textAlign: TextAlign.justify),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "Todas las habitaciones del hotel cuentan con zona de estar, TV de pantalla plana con canales vía satélite y baño privado con artículos de aseo gratuitos y ducha. Las habitaciones disponen de escritorio.",
                                      textAlign: TextAlign.justify),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "El Hotel La Primavera sirve un desayuno continental todas las mañanas.",
                                      textAlign: TextAlign.justify),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "En el alojamiento se puede jugar al ping pong y a los dardos.",
                                      textAlign: TextAlign.justify),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "San Andrés se encuentra a 14 km del Hotel La Primavera.",
                                      textAlign: TextAlign.justify),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Admite mascotas.",
                                      textAlign: TextAlign.justify),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: TitleWithDivider(title: "Cotización"),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: CustomInput1(
                              icon: Icons.note,
                              placeholder: "Nombre",
                              textEditingController: TextEditingController(),
                              textInputType: TextInputType.text,
                              isPassword: false,
                              function: () {}),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: CustomInput1(
                              icon: Icons.mail,
                              placeholder: "Correo",
                              textEditingController: TextEditingController(),
                              textInputType: TextInputType.emailAddress,
                              isPassword: false,
                              function: () {}),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: CustomInputPhone(
                              icon: Icons.phone,
                              placeholder: "Teléfono",
                              textEditingController: TextEditingController(),
                              textInputType: TextInputType.phone,
                              function: () {}),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
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
                              CuadroFechaEscapada(
                                label: "Fecha de Ida",
                                function: () {
                                  _.updateDate("fechaIda");
                                },
                                width: Get.width * 0.39,
                                id: "fechaIda",
                              ),
                              CuadroFechaEscapada(
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
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: TitleWithDivider(
                            title: "Habitaciones",
                            fontSize: 14,
                          ),
                        ),
                        ListadoHabitacionesEscapada(),
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
                              textEditingController: TextEditingController(),
                              placeholder: "Observaciones",
                              readOnly: false,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomButton(
                            text: "Enviar",
                            onPress: () {},
                            color: Color(0xff56E2C6),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}