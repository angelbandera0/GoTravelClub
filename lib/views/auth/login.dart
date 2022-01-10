import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: Get.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(),
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
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.person_outline,
              placeholder: "Usuario",
              isPassword: false,
              textEditingController: emailCtrl,
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
              color: Color(0xff621771),
              onPress: () {
                Get.offAndToNamed("/inicio");
                /*AuthService auth = AuthService();
               auth.login({
                  "email": emailCtrl.value.text,
                  "password": passCtrl.value.text
                }).then((value) => Get.toNamed("/home"));*/
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
