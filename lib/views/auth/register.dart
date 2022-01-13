import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/services/user_service.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input.dart';
import 'package:gotravelclub/widgets/label.dart';
import 'package:gotravelclub/widgets/logo.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: Get.height*0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(),
                _Form(),
                Labels(),
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
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserService us=UserService();
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.perm_identity_outlined,
              placeholder: "Nombre y Apellidos",
              isPassword: false,
              textEditingController: nameCtrl,
              textInputType: TextInputType.text,
              function: (){},
            ),
            CustomInput(
              icon: Icons.mail_outline,
              placeholder: "Correo",
              isPassword: false,
              textEditingController: emailCtrl,
              textInputType: TextInputType.emailAddress,
              function: (){},
            ),
            CustomInput(
              icon: Icons.local_phone_outlined,
              placeholder: "Número de teléfono",
              isPassword: false,
              textEditingController: phoneCtrl,
              textInputType: TextInputType.phone,
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
            SizedBox(height: 15,),
            CustomButton(text: 'Registrar',color: Color(0xff621771), onPress: (){
              //User u= User(name: "Angel",password: "12345678",email: "angelbandera0@gmail.com");
              //us.postUser(u.toJson());
            },)
          ],
        ));
  }
}

