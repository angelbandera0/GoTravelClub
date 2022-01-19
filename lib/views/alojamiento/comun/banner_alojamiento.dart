import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/detallesAlojamientoController.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/widgets/appBarDetalles.dart';

class BannerAlojamiento extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesAlojamientoController>(
        id: "bannerAlojamiento",
        init: DetallesAlojamientoController(),
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
                    child: CachedNetworkImage(
                      imageUrl:
                      "https://www.gotravelclub.com.ec/${_.currentImg}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) {
                        print(error);
                       return Icon(Icons.error);
                      }
                    )
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
                      autoPlayInterval: Duration(seconds: 10),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 0.5,
                      //enlargeCenterPage: false,
                    ),
                    items: [_.alojamiento.imagen1,_.alojamiento.imagen2,_.alojamiento.imagen3,_.alojamiento.imagen4].map((i) {
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
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    "https://www.gotravelclub.com.ec/${i}",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                        ),
                                      ),width: Get.width*0.5,
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: Container(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
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
