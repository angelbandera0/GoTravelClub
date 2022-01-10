import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final int minLines;
  final bool readOnly;
  final TextEditingController textEditingController;
  final String placeholder;

  const CustomTextArea(
      {Key? key,
      this.minLines = 3,
      this.readOnly = false,
      required this.textEditingController,
      this.placeholder = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: this.minLines,
      readOnly: this.readOnly,
      keyboardType: TextInputType.multiline,
      controller: this.textEditingController,
      maxLines: null,
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: this.placeholder,
      ),
    );
  }
}
