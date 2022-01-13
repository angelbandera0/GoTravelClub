import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/services/auth_service.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/label.dart';
import 'package:gotravelclub/widgets/logo.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: Get.height+30,
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                // autoPlay: false,
              ),
              items: ["back1.png","back2.png","back3.png","back4.png"]
                  .map((item) => Container(
                width: Get.width,
                child: Image.asset(
                      "assets/auth/${item}",
                      fit: BoxFit.cover,
                      height: Get.height,
                    ),
              ))
                  .toList(),
            ),
            Container(width: Get.width,height: Get.height,color: Colors.black.withOpacity(0.2),),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: Get.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Logo(),
                    SizedBox(height: Get.height*0.1),
                    _Form(),
                    //Labels(),
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: Text(
                        "Términos y condiciones de uso",
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  AuthService auth = AuthService(new DioClient().init());
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.person_outline,
              placeholder: "Usuario",
              isPassword: false,
              textEditingController: userCtrl,
              textInputType: TextInputType.text,
              function: (){},
            ),
            CustomInput(
              icon: Icons.lock_outline,
              placeholder: "Contraseña",
              isPassword: true,
              textEditingController: passCtrl,
              textInputType: TextInputType.text,
              function: (){},
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Ingresar',
              color: Color(0xff52E2C6),
              onPress: () {
                //Get.offAndToNamed("/alojamiento");
                User u=User(username: userCtrl.text,password: passCtrl.text);
                auth.login(u).then((value) => print(value));

              },
            )
          ],
        ));
  }
  void tryy() async {
  /*FilePickerResult? result = await FilePicker.platform.pickFiles();


  File file = File(result!.files.single.path??"");
  print(file.path);
*/
  }
}
