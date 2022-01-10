import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 70,left: 20,right: 20),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/logo.png')),

          ],
        ),
      ),
    );
  }
}
