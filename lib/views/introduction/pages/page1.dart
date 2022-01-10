import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Page1 {
  final PageDecoration pageDecoration;

  const Page1({required this.pageDecoration});

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
                "Bienvenido",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 5.0, bottom: 10, left: 24, right: 30),
              child: Text(
                "Nos da mucha alegría tenerlo por acá. Con nuestra aplicación estaremos más cerca y podemos establecer mejor comunicación contigo.",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/intro/colibri1.png',
              width: 350,
              alignment: Alignment.topLeft,
            ),
          ],
        ));
  }
}
