import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesAlojamientoController.dart';
import 'package:gotravelclub/views/alojamiento/comun/banner_alojamiento.dart';
import 'package:gotravelclub/views/alojamiento/comun/cuadro_fecha_alojamiento.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/custom_input_phone.dart';
import 'package:gotravelclub/widgets/custom_textarea.dart';

import 'comun/listado_habitaciones_alojamiento.dart';

class DetallesAlojamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: "detallesAlojamiento",
        init: DetallesAlojamientoController(),
        builder: (_) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                BannerAlojamiento(),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
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
                      textEditingController: TextEditingController(),
                      placeholder: "Observaciones",
                      readOnly: false,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                    text: "Enviar",
                    onPress: () {},
                    color: Color(0xff319141),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ));
        });
  }
}
