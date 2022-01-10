import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input_number.dart';

class MultiplesDestinos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleWithDivider(title: "Información del Vuelo"),
        //destinos de aeropuertos
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: Get.width * 0.9,
              height: Get.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: Get.width * 0.26,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("JMC",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        AutoSizeText("José Martí International Airport",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/intro/img_avion.png",
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: Get.width * 0.26,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("JMC",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        AutoSizeText("José Martí International Airport",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //Fechas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Fecha de ida
              Material(
                elevation: 6,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: new Center(
                  child: new Ink(
                    width: Get.width * 0.39,
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
                            minTime: DateTime(2018, 3, 5),
                            maxTime: DateTime(2019, 6, 7),
                            onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              print('confirm $date');
                            },
                            currentTime: DateTime.now(),
                            locale: LocaleType.es);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Fecha de Ida",
                              style:
                              TextStyle(fontWeight: FontWeight.w300)),
                          Text(
                            "2021-01-05",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Fecha de Regreso

            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            width: Get.width*0.9,
              child: TextButton(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add,color: Color(0xff621771)),
                  Text("Agregar tramos",style: TextStyle(color: Color(0xff621771)),),
                ],
              ),onPressed: (){},)),
        ),
        SizedBox(
          height: 20,
        ),
        //Pasajeros
        TitleWithDivider(title: "Pasajeros"),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Adultos",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("Cantidad de adultos",style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300)),
                    ]
                ),
                Container(
                    width: Get.width*0.4,
                    padding: EdgeInsets.only(top: 10,right: 5),
                    child: CustomInputNumber(icon: Icons.people_outlined, placeholder: "", textEditingController: TextEditingController(), textInputType: TextInputType.number, function: (){})),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Menores",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("Cantidad de menores",style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300)),
                    ]
                ),
                Container(
                    width: Get.width*0.4,
                    padding: EdgeInsets.only(top: 10,right: 5),
                    child: CustomInputNumber(icon: Icons.people_outlined, placeholder: "", textEditingController: TextEditingController(), textInputType: TextInputType.number, function: (){})),
              ],
            )

          ],
        ),
        //Clase
        TitleWithDivider(title: "Clase"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 3),
          child: Material(
            elevation: 6,

            child: DropdownSearch<String>(
              mode: Mode.BOTTOM_SHEET,
              items: ["Económica", "Primera Clase", 'Premiun',"Bussiness"],
              label: "Clase",
              hint: "Selecciona la clase a viajar.",
              onChanged: print,
              selectedItem: "Económica",),
          ),
        ),
        SizedBox(height: 40,),
        CustomButton(text: "Enviar", onPress: (){},color: Color(0xff319141),),
        SizedBox(height: 20,),
      ],
    );
  }
}
