import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final int minLines;
  final bool readOnly;
  final TextEditingController textEditingController;
  final String placeholder;
  late Function? function;

  CustomTextArea(
      {Key? key,
      this.minLines = 3,
      this.readOnly = false,
      required this.textEditingController,
      this.placeholder = "", this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 1),
                blurRadius: 5)
          ],
        borderRadius: BorderRadius.all(Radius.circular(10),)
      ),
      child: TextField(
        minLines: this.minLines,
        readOnly: this.readOnly,
        keyboardType: TextInputType.multiline,
        controller: this.textEditingController,
        maxLines: null,
        onChanged:(value){
          this.function!();
        } ,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: this.placeholder,
        ),
      ),
    );
  }
}
