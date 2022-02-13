import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FailedSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            Text("Hola, no hemos encontrado lo que buscas pero podemos ayudarte si nos envias un email con tu solicitud directamente a nuestro correo de reservas.",textAlign: TextAlign.center,),
            TextButton(onPressed: (){
              _launchURL("mailto:reservas@gotravelclub.com.ec");
            }, child: Text("reservas@gotravelclub.com.ec"))
          ]
      ),
    );
  }
  _launchURL(String u) async {
    var url =u;
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
