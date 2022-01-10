import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final Color color;

  const CustomButton({Key? key, required this.text, required this.onPress, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPress,
      style: ElevatedButton.styleFrom(
          elevation: 8,
          primary: this.color, shape: StadiumBorder()),
      child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
              child: Text(
            this.text,
            style: TextStyle(fontSize: 17),
          ))),
    );
  }
}
