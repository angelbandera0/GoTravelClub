import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CuadroCorto extends StatelessWidget {
  String url;
  final String nombre;
  final String ubicacion;
  final String urlDetails;
  final dynamic object;
  String urlBase = "https://www.gotravelclub.com.ec";

  CuadroCorto(
      {Key? key,
      required this.url,
      required this.nombre,
      required this.ubicacion,
      required this.urlDetails,required this.object})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.url[0] == "/") {
      this.url = (this.url.substring(1, this.url.length));
    }
    return Padding(
      padding: const EdgeInsets.only(top: 4.0,left: 4,bottom: 4,right: 10),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Ink(
            width: Get.width * 0.5,
            height: Get.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: new InkWell(
              splashColor: Color(0xff611771).withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                Get.toNamed(this.urlDetails,arguments: object);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://www.gotravelclub.com.ec/${this.url}",
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
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                      padding: const EdgeInsets.only(left: 5.0),
                      child: AutoSizeText(
                        this.ubicacion,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff621771).withOpacity(0.6)),
                        maxLines: 2,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
