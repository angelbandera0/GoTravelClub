import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/widgets/custom_button.dart';

class Mantenimiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/fondo/fondo.png",
                    width: Get.width,
                    height: 136,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 35, 20, 0),

                    //color: Colors.blue,

                    child: Column(
                      children: [

                      ],
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: Size(Get.width, 75),
          ),
          body: Stack(
            children: [
              ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: Get.height,fit: BoxFit.cover,),),
              Container(
                padding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Center(
                    child:Column(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.tools,size: 90,color: Color(0xff621771),),
                        SizedBox(height: 10,),
                        Text("Lo sentimos pero estamos temporalmente offline por motivos de mantenimiento.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
                        SizedBox(height: 10,),
                        Text("Disculpen las molestias que hayan sido causadas.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                        SizedBox(height: 30,),
                        CustomButton(text: "Reintentar", onPress: (){Get.offNamed("/alojamiento");}, color: Color(0xff56E2C6))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );;
  }
}
