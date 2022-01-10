import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CuadroLargo extends StatelessWidget {
  final String url;
  final String nombre;
  final String ubicacion;
  final String urlDetails;

  const CuadroLargo(
      {Key? key,
      required this.url,
      required this.nombre,
      required this.ubicacion, required this.urlDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      elevation: 6,
      child: Ink(
          width: Get.width,
          height: Get.height * 0.22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          child: new InkWell(
            splashColor: Color(0xff611771).withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: () {
              Get.toNamed(this.urlDetails);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: Get.width,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(
                        this.url,
                        width: 150,
                        height: 135,
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    this.nombre,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff621771)),
                  ),
                ),
                SizedBox(
                  height: 2.5,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: AutoSizeText(
                      this.ubicacion,
                      style: TextStyle(
                          fontSize: 10, color: Color(0xff621771).withOpacity(0.6)),
                      maxLines: 2,
                    )),
              ],
            ),
          )),
    );
  }
}
