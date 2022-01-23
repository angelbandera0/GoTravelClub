import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/aboutController.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';

class About extends StatelessWidget {
  late MyDrawerController drawerController;

  About({Key? key}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
        id: "about",
        init: AboutController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainAbout());
        });
  }
}

class MainAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
        id: "mainabout",
        builder: (_) {
          return Stack(
            children: [
              Scaffold(
                appBar: PreferredSize(
                  child: Stack(
                    children: [
                      ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: 136,fit: BoxFit.cover,),),
                      Container(
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
                    ],
                  ),
                  preferredSize: Size(Get.width, 75),
                ),
                body: Stack(
                  children: [
                    ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: Get.height,fit: BoxFit.cover,),),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      // Center is a layout widget. It takes a single child and positions it
                      // in the middle of the parent.
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(child: Text("Misión de la Agencia",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,)),
                            SizedBox(height: 10,),
                            Text("Ofrecer a nuestros distinguidos clientes un servicio integral y exclusivo a través de productos turísticos que garanticen la máxima satisfacción en sus viajes. Adicionalmente promocionar las potencialidades turísticas del Ecuador dentro y fuera del país.",textAlign: TextAlign.justify,style: TextStyle(fontSize: 16),),
                            SizedBox(height: 40,),
                            Center(child: Text("Visión de la Agencia",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,)),
                            SizedBox(height: 10,),
                            Text("Ser una empresa turística de referencia nacional, brindando a nuestros clientes seguridad y confianza, perfeccionando el servicio a la par del desarrollo social y promoviendo las mejores alternativas de viajes que cumplan con las expectativas de nuestros clientes. ",textAlign: TextAlign.justify,style: TextStyle(fontSize: 16),),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),

            ],
          );
        });

  }
}
