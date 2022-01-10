import 'package:flutter/material.dart';

const defaultColor=Color(0xff621771);
const defaultPadding=EdgeInsets.all(0);
class TitleWithDivider extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final EdgeInsets padding;


  const TitleWithDivider({Key? key, required this.title, this.fontSize=20, this.color=defaultColor, this.padding=defaultPadding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: this.fontSize,
                color: this.color),
          ),
          Divider(
            color: this.color.withOpacity(0.3),
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
