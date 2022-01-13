import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesTourController.dart';
import 'package:gotravelclub/widgets/appBarDetalles.dart';

class BannerTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesTourController>(
        id: "bannerTour",
        init: DetallesTourController(),
        builder: (_) {
          return Container(
            width: Get.width,
            height: Get.height * 0.35,
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      "assets/muestra/${_.currentImg}",
                      fit: BoxFit.cover,
                      width: Get.width * 0.5,
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height * 0.25,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.3), Colors.white],
                    begin: FractionalOffset(0.0, 0.6),
                    end: FractionalOffset(0.0, 1.0),
                  )),
                ),
                Container(
                  padding: EdgeInsets.only(top: Get.height * 0.2),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: Get.height * 0.15,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        _.updateBanner(index);
                      },
                      initialPage: _.currentIndex,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 0.5,
                      //enlargeCenterPage: false,
                    ),
                    items: _.images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Material(
                              elevation: 6,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                width: Get.width * 0.5,
                                //margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.amber),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Image.asset(
                                    "assets/muestra/$i",
                                    fit: BoxFit.cover,
                                    width: Get.width * 0.5,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                AppBarDetalles()
              ],
            ),
          );
        });
  }
}
