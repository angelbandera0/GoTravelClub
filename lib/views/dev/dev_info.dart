import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/contactController%20copy.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';
import 'package:url_launcher/url_launcher.dart';

class DevInfo extends StatelessWidget {
  late MyDrawerController drawerController;

  DevInfo({Key? key}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevsController>(
        id: "contact",
        init: DevsController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainContact());
        });
  }
}

class MainContact extends StatelessWidget {
  _launchURL(String u) async {
    var url = u;
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevsController>(
        id: "maindevs",
        builder: (_) {
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
                    ClipRRect(
                      child: Image.asset(
                        "assets/fondo/fondo.png",
                        width: Get.width,
                        height: Get.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      // Center is a layout widget. It takes a single child and positions it
                      // in the middle of the parent.
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: Text(
                              "Desarrollada por:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Angel Ernesto && Nox Solutions",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: Text(
                              "Versión:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${_.versionapp}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: Text(
                              "Información:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Correo",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            TextButton(
                                onPressed: () {
                                  _launchURL("mailto:angelbandera0@gmail.com");
                                },
                                child: Text(
                                  "angelbandera0@gmail.com",
                                  style: TextStyle(
                                      color: Color(0xff621771), fontSize: 20),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            TextButton(
                                onPressed: () {
                                  _launchURL("mailto:mmcsoporte@yandex.com");
                                },
                                child: Text(
                                  "mmcsoporte@yandex.com",
                                  style: TextStyle(
                                      color: Color(0xff621771), fontSize: 20),
                                )),
                            Text(
                              "Whatsapp",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            TextButton(
                                onPressed: () {
                                  _launchURL("https://wa.me/+5358682295");
                                },
                                child: Text(
                                  "+53 58682295",
                                  style: TextStyle(
                                      color: Color(0xff621771), fontSize: 20),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            TextButton(
                                onPressed: () {
                                  _launchURL("https://wa.me/+5358477311");
                                },
                                child: Text(
                                  "+5358477311",
                                  style: TextStyle(
                                      color: Color(0xff621771), fontSize: 20),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Copyright © 2021 Gotravelclub",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22),
                            ),
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

final Color facebookColor = const Color(0xff39579A);
final Color twitterColor = const Color(0xff00ABEA);
final Color instaColor = const Color(0xffBE2289);
final Color whatsappColor = const Color(0xff075E54);
final Color linkedinColor = const Color(0xff0085E0);
final Color githubColor = const Color(0xff202020);
final Color googleColor = const Color(0xffDF4A32);

class CustomWidgets {
  static Widget socialButtonRect(title, color, icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }

  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          )), //
    );
  }
}
