import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputAge extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Function function;

  const CustomInputAge(
      {Key? key,
      required this.textEditingController,
      required this.textInputType,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 20),
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
          keyboardType: this.textInputType,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged:(value){
            if(int.parse(value)>17){
              this.textEditingController.text="17";
            }
            this.function();
        } ,
          decoration: InputDecoration(
             // prefixIcon: Icon(this.icon),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
          //    hintText: this.placeholder

          ),
          controller: this.textEditingController,

        ));
  }

}
