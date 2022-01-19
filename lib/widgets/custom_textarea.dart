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
    return TextField(
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
    );
  }
}
