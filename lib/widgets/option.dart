import 'package:flutter/material.dart';
import 'package:get/get.dart';
 class Option extends StatelessWidget {
   final List<Color> colors;
   final IconData icon;
   final String text;

  const Option({Key? key, required this.colors, required this.icon, required this.text}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Material(
         color: Colors.transparent,
         child: InkWell(
         onTap: () {
           Get.toNamed("/add_album");
         },
     child: Ink(child: Container(
       width: Get.width,
       height: Get.height*0.12,
       decoration: BoxDecoration(
         gradient: LinearGradient(colors: colors),
         borderRadius: BorderRadius.all(Radius.circular(25)),
       ),
       margin: EdgeInsets.only(top: 0,bottom: 15),
       padding: EdgeInsets.only(left: 10),
       child: Row(

         children: [
           Container(
             width:60,
             height:60,
             child: Icon(icon,size: 50,color: colors[0],),
             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15)),),
           ),
           SizedBox(width: 10,),
           Text("${text}",style: TextStyle(fontSize: 20,color: Colors.white),)
         ],),
     ))));
   }
 }
