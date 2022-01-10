import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_textarea.dart';
 class CardCotizacion extends StatelessWidget {
   final Color color;
   final String title;
   final IconData icon;

  const CardCotizacion({Key? key, required this.color, required this.title, required this.icon}) : super(key: key);
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
                                   Icon(this.icon,size: 25,color: Colors.white),
                                   Padding(
                                     padding: const EdgeInsets.only(top: 5,left: 10),
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
                               _buildFecha("Ida", "01/01/2022"),
                               _buildFecha("Regreso", "10/01/2022"),

                             ],
                           ),
                           SizedBox(height: 30),
                           TitleWithDivider(
                             title: "Información de alojamiento",
                             fontSize: 14,
                             key: key,
                             color: Colors.grey,
                           ),
                           _alojamiento(1, 2, 1),
                           _alojamiento(2, 2, 0),
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
                             child: CustomTextArea( readOnly: true,textEditingController: TextEditingController(),)
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

   Widget _buildFecha(String label, String fecha){
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

   Widget _alojamiento(int index, int cantAdultos, int cantMenores){
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
                   color: Color(0xff621771),
                   fontWeight: FontWeight.bold),
             ),
           ),
           SizedBox(
             width: 30,
           ),
           _cell("Cantidad de Adultos", "$cantAdultos"),
           SizedBox(
             width: 30,
           ),
           _cell("Cantidad de Adultos", "$cantMenores"),
         ],
       ),
     );
   }

   Widget _cell(String label, String cant){
     return Padding(
         padding: const EdgeInsets.only(bottom: 10.0),child:Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(label,
             style: TextStyle(
                 color: Colors.grey,
                 fontWeight: FontWeight.bold)),
         Text(cant),
       ],
     ));
   }
 }
