import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPassword;
  final Function function;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.textEditingController,
      required this.textInputType,
      required this.isPassword,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 1),
                  blurRadius: 5)
            ]),
        child: TextField(
          autocorrect: false,
          textAlign: TextAlign.start,
          keyboardType: this.textInputType,obscureText: this.isPassword,onChanged:(value){
            this.function();
        } ,
          decoration: InputDecoration(
              prefixIcon: Icon(this.icon),hintStyle: TextStyle(),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeholder),controller: this.textEditingController,
        ));
  }
}
