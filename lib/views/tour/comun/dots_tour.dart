import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesTourController.dart';

class DotsTour extends StatelessWidget {
  final CarouselController carouselController;
  final List<dynamic> list;
  String _id = "dotsTour";
  DotsTour(
      {Key? key, required this.carouselController, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesTourController>(
        id: _id,
        builder: (_) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => this.carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                                _.currentDots == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList());
        });
  }
}
