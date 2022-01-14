import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCuadroLargo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0,left: 4,bottom: 4,right: 10),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Container(
          width: Get.width,
          height: Get.height * 0.22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: Container(
                      width: Get.width,
                      height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color:Colors.white
                        ),
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,bottom: 5),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: true,
                      child: Container(
                        width: Get.width * 0.7,
                        height: 10,
                        decoration: BoxDecoration(
                            color:Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: true,
                      child: Container(
                        width: Get.width * 0.45,
                        height: 10,
                        decoration: BoxDecoration(
                            color:Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
      ),
    );
  }

}