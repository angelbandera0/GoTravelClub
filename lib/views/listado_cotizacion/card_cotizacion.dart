import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/cotizacionController.dart';
import 'package:gotravelclub/models/response/cotizacionResponse.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_textarea.dart';
import 'package:intl/intl.dart';

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
    TextEditingController taCtrl=TextEditingController();
    taCtrl.text=info.observation!;
    return GetBuilder<CotizacionController>(
        id: "card_cotizacion",
        builder: (_) {
          alojamientos=[];
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
                              child: Text(
                                  "${info.observation}"),
                            ),
                            TitleWithDivider(
                              title: "Respuesta",
                              fontSize: 14,
                              key: key,
                              color: Colors.grey,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 0, left: 5, bottom: 5, right: 20),
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          offset: Offset(0, 0),
                                          blurRadius: 1)
                                    ]),
                                child: CustomTextArea(
                                  readOnly: true,
                                  textEditingController:
                                      TextEditingController(),
                                )),
                            CustomButton(
                                text: "Validar Pagos",
                                onPress: () {},
                                color: Color(0xff56E2C6))
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
