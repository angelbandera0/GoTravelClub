import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Opcion extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final String url;

  const Opcion({Key? key, required this.label, required this.icon, required this.color, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: new Ink(
        width: Get.width * 0.25,
        height: Get.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            border: Border(
              top: BorderSide(color: this.color, width: 3),
              right: BorderSide(color: this.color, width: 3),
              left: BorderSide(color: this.color, width: 3),
              bottom: BorderSide(color: this.color, width: 3),
            )),
        child: new InkWell(
          splashColor: Color(0xff611771).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),

          onTap: () {
            Get.toNamed(this.url);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                this.icon,
                size: Get.height * 0.06,
                color: this.color,
              ),
              Text(this.label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
