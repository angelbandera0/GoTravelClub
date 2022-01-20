import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/authController.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/services/auth_service.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/label.dart';
import 'package:gotravelclub/widgets/loading.dart';
import 'package:gotravelclub/widgets/logo.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        id: "login",
        init: AuthController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: Color(0xffF2F2F2),
            body: SafeArea(
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: Get.height + 30,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      // autoPlay: false,
                    ),
                    items: ["back1.jpg", "back2.jpg", "back3.jpg", "back4.jpg","back5.jpg"]
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
                  Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      height: Get.height * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Logo(),
                          SizedBox(height: Get.height * 0.1),
                          _Form(authController: _),
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
                  LoadingLogin()
                ],
              ),
            ),
          );
        });
  }
}

class _Form extends StatelessWidget {
  final AuthController authController;
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  _Form({Key? key, required this.authController}) : super(key: key);

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
              function: () {},
            ),
            CustomInput(
              icon: Icons.lock_outline,
              placeholder: "Contraseña",
              isPassword: true,
              textEditingController: passCtrl,
              textInputType: TextInputType.text,
              function: () {},
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Ingresar',
              color: Color(0xff52E2C6),
              onPress: () {
                authController.login(userCtrl.text, passCtrl.text);
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

class LoadingLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        id: "loading",
        builder: (_) {
          return (_.isLoading)?Loading():Container();
        });
  }

}