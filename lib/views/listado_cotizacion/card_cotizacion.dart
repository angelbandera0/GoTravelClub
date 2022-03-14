import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/cotizacionController.dart';
import 'package:gotravelclub/models/response/cotizacionResponse.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_textarea.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CardCotizacion extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final Info info;
  List<Widget> alojamientos = [];

  CardCotizacion(
      {Key? key,
      required this.color,
      required this.title,
      required this.icon,
      required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController taCtrl = TextEditingController();
    taCtrl.text = info.observation!;
    return GetBuilder<CotizacionController>(
        id: "card_cotizacion",
        builder: (_) {
          alojamientos = [];
          for (int i = 0; i < info.rooms!.length; i++) {
            alojamientos.add(_alojamiento(i + 1, info.rooms![i].countAdults!,
                info.rooms![i].agesMinors!));
          }
          return ExpandableNotifier(
              child: Padding(
            padding: const EdgeInsets.all(0),
            child: ScrollOnExpand(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        hasIcon: false,
                      ),
                      header: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: this.color,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              ExpandableIcon(
                                theme: const ExpandableThemeData(
                                  expandIcon: Icons.arrow_right,
                                  collapseIcon: Icons.arrow_drop_down,
                                  iconColor: Colors.white,
                                  iconSize: 28.0,
                                  //iconRotationAngle: math.pi / 2,
                                  iconPadding: EdgeInsets.only(right: 5),
                                  hasIcon: false,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(this.icon,
                                        size: 25, color: Colors.white),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 10),
                                      child: Text(
                                        this.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      collapsed: Container(),
                      expanded: Container(
                        padding: EdgeInsets.all(20),
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "${info.title}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            TitleWithDivider(
                              title: "Estado",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text("${info.status}"),
                            ),
                            TitleWithDivider(
                              title: "Nombre",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text("${info.name}"),
                            ),
                            TitleWithDivider(
                              title: "Correo",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text("${info.email}"),
                            ),
                            TitleWithDivider(
                              title: "Teléfono",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Text("${info.phone}"),
                            ),
                            TitleWithDivider(
                              title: "Fecha de Viaje",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildFecha("Ida",
                                    "${DateFormat("dd-MM-yyyy").format(info.dateFrom!)}"),
                                _buildFecha("Regreso",
                                    "${DateFormat("dd-MM-yyyy").format(info.dateTo!)}"),
                              ],
                            ),
                            SizedBox(height: 30),
                            TitleWithDivider(
                              title: "Información de alojamiento",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Container(
                              child: Column(
                                children: alojamientos,
                              ),
                            ),
                            SizedBox(height: 20),
                            TitleWithDivider(
                              title: "Observaciones",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text("${info.observation}"),
                            ),
                            TitleWithDivider(
                              title: "Respuesta",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Html(
                                data: info.response,
                                // Styling with CSS (not real CSS)
                              ),
                            ),
                            (info.isPayment!)
                                ? Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TitleWithDivider(
                                          title: "Información del pago",
                                          fontSize: 14,
                                          key: key,
                                          color: Colors.grey,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Fecha",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${info.infopayment!.date_payment}")
                                                ],
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Monto",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${info.infopayment!.amount}")
                                                ],
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Moneda",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${info.infopayment!.currency_code}")
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 10,
                            ),
                            (info.status == "Validado")
                                ? Container(
                                    width: Get.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border: Border(
                                          top: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                          right: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                          left: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                          bottom: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                        )),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.info,
                                          size: 30,
                                          color: Color(0xff56E2C6),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "En espera del pago de la cotización.",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                            (info.status == "Pagado" &&
                                    info.infopayment!.payment_state !=
                                        "reembolsado")
                                ? Container(
                                    width: Get.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border: Border(
                                          top: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                          right: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                          left: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                          bottom: BorderSide(
                                              color: Color(0xff56E2C6),
                                              width: 3),
                                        )),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.info,
                                          size: 30,
                                          color: Color(0xff56E2C6),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "La cotización está siendo procesada.",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                            (info.status == "Pagado" &&
                                    info.infopayment!.payment_state ==
                                        "reembolsado")
                                ? Container(
                                    width: Get.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border: Border(
                                          top: BorderSide(
                                              color: Colors.red, width: 3),
                                          right: BorderSide(
                                              color: Colors.red, width: 3),
                                          left: BorderSide(
                                              color: Colors.red, width: 3),
                                          bottom: BorderSide(
                                              color: Colors.red, width: 3),
                                        )),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.info,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Su pago ha sido reembolsado.",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                            (info.status == "Pendiente" && info.response != "")
                                ? CustomButton(
                                    text: "Aceptar Cotización",
                                    onPress: () {
                                      //_launchURL();
                                      Get.defaultDialog(
                                        title: "Mensage de notificación",
                                        middleText:
                                            "¿Está de acuerdo con la cotización enviada?",
                                        backgroundColor: Colors.white,
                                        textConfirm: "Confirmar",
                                        textCancel: "Cancelar",
                                        cancelTextColor: Color(0xff56E2C6),
                                        confirmTextColor: Colors.white,
                                        buttonColor: Color(0xff56E2C6),
                                        onConfirm: () {
                                          _launchURL();
                                          Navigator.pop(context);
                                        },
                                        titleStyle:
                                            TextStyle(color: Colors.black54),
                                        middleTextStyle:
                                            TextStyle(color: Colors.black54),
                                      );
                                    },
                                    color: Color(0xff56E2C6))
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        });
  }

  _launchURL() async {
    var url =
        'https://www.gotravelclub.com.ec/validate_quote/?pk=${info.pk}&type=${(info.type == 1) ? "accommodation" : "tour"}';
    if (!await launch(url)) throw 'Could not launch $url';
  }

  Widget _buildFecha(String label, String fecha) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithDivider(
          title: label,
          fontSize: 14,
          key: key,
          color: Colors.grey,
        ),
        Text(fecha),
      ],
    );
  }

  Widget _alojamiento(int index, int cantAdultos, List<int> menores) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Habitación #$index",
              style: TextStyle(
                  color: Color(0xff621771), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          _cell("Cantidad de Adultos", "$cantAdultos"),
          SizedBox(
            width: 30,
          ),
          _cellMenores("Menores de Edad", menores),
        ],
      ),
    );
  }

  Widget _cell(String label, String cant) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            Text(cant),
          ],
        ));
  }

  Widget _cellMenores(String label, List<int> edades) {
    List<Widget> list = [
      Text("${label} (${edades.length})",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))
    ];
    edades.forEach((element) {
      list.add(Text("${element}"));
    });
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        ));
  }
}
