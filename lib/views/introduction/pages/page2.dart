import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Page2 {
  final PageDecoration pageDecoration;

  const Page2({required this.pageDecoration});

  PageViewModel getPage() {
    return PageViewModel(
        title: "",
        decoration: pageDecoration,
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5, left: 24),
              child: Text(
                "¿Qué puedes hacer?",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 5.0, bottom: 0, left: 24, right: 30),
              child: Text(
                "Podrás desde la comodidad de tú casa ver nuestras ofertas de:",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 0.0, bottom: 0, left: 40, right: 30),
              child: Column(children: [
                SizedBox(height: 5,),
                _buildTextVinneta("Alojamiento"),
                SizedBox(height: 5,),
                _buildTextVinneta("Tours"),
                SizedBox(height: 5,),
                _buildTextVinneta("Excurciones"),
                SizedBox(height: 5,),
              ],)
            ),
            const Padding(
              padding:
              EdgeInsets.only(top: 0.0, bottom: 25, left: 24, right: 30),
              child: Text(
                "Y mucho mejor podrás reservar tus vuelos de forma más fácil y sencilla.",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            Center(
              child: Text(
                "Escápate de la rutina",
                style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Image.asset(
                'assets/intro/colibri2.png',
                width: 350,
                alignment: Alignment.topRight,
              ),
            ),
          ],
        ));
  }
  Widget _buildTextVinneta(String text){

    return Row(
      children: [
        Icon(Icons.wb_sunny,color: Colors.black54,),
        SizedBox(width: 10,),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ],);
  }
}
