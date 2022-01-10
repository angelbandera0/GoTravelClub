import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Page3 {
  final PageDecoration pageDecoration;

  const Page3({required this.pageDecoration});

  PageViewModel getPage() {
    return PageViewModel(
        title: "",
        decoration: pageDecoration,
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.asset(
              'assets/intro/colibri3.png',
              width: 350,
              alignment: Alignment.topLeft,
            ),
             Center(
              child: Text(
                "Ahora solo acompáñanos y",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                "Explora el mundo con nosotros",
                style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
