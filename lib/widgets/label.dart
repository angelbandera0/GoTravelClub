import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String route=Get.currentRoute;
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            (route=="/login")?"¿No tienes cuenta?":"¿Posees cuenta?",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){
              (route=="/login")?
              Get.toNamed("/register")
              :
              Get.toNamed("/login");
            },
            child: Text(
              (route=="/login")?'Crea una ahora!':'Inicia Sesión!',
              style:
              TextStyle(color: Color(0xff621771).withOpacity(0.6), fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}