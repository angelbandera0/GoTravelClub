import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/cotizaci%C3%B3nController.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/views/listado_cotizaci%C3%B3n/card_cotizacion.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';

class Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CotizacionController>(
        id: "cotizacion",
        init: CotizacionController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainCotizacion());
        });

  }
}

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    color: Color(0xff621771),
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
                              Icon(Icons.home,size: 25,color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,left: 10),
                                child: Text(
                                  "Alojamientos",
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
                          "Hotel Naz Pinas del Lago",
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
                        child: Text("María Estevez Fonseca"),
                      ),
                      TitleWithDivider(
                        title: "Correo",
                        fontSize: 14,
                        key: key,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("maria@gmail.com"),
                      ),
                      TitleWithDivider(
                        title: "Teléfono",
                        fontSize: 14,
                        key: key,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Text("(+583) 983911124"),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleWithDivider(
                                title: "Ida",
                                fontSize: 14,
                                key: key,
                                color: Colors.grey,
                              ),
                              Text("04/03/2021"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleWithDivider(
                                title: "Regreso",
                                fontSize: 14,
                                key: key,
                                color: Colors.grey,
                              ),
                              Text("04/03/2021"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      TitleWithDivider(
                        title: "Información de alojamiento",
                        fontSize: 14,
                        key: key,
                        color: Colors.grey,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Habitación #0",
                              style: TextStyle(
                                  color: Color(0xff621771),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cantidad de adultos",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text("2"),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cantidad de menores",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text("1"),
                              ],
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Habitación #1",
                              style: TextStyle(
                                  color: Color(0xff621771),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cantidad de adultos",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text("2"),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cantidad de menores",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text("1"),
                              ],
                            )
                          ],
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
                            "Esto es una nota a tener en cuenta por el uss."),
                      ),
                      TitleWithDivider(
                        title: "Respuesta",
                        fontSize: 14,
                        key: key,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0, left: 5, bottom: 5, right: 20),
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
                        child: TextFormField(
                          minLines: 3,
                          readOnly: true,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      CustomButton(text: "Validar Pagos", onPress: (){}, color: Color(0xff319141))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class MainCotizacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return GetBuilder<CotizacionController>(
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
                    ],
                  ),
                ),
              ),
              preferredSize: Size(Get.width, 70),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: ExpandableTheme(
                  data: const ExpandableThemeData(
                    iconColor: Colors.blue,
                    useInkWell: true,
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: <Widget>[
                      CardCotizacion(color: Color(0xff621771), title: "Alojamiento (A04032021-45)", icon: Icons.home),
                      CardCotizacion(color: Colors.pinkAccent, title: "Tours (T056325691-45)", icon: Icons.public),
                    ],
                  )),
            ),
          );
        });
  }
}
