import 'package:flutter/material.dart';

class TextDetallesInfo extends StatelessWidget {
  final String text;

  const TextDetallesInfo({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Text(
          this.text,
          textAlign: TextAlign.justify),
    );
  }
}
