import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/cotizacionController.dart';
import 'package:gotravelclub/views/custom/titleWithDivider.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/loading.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CotizacionController>(
        id: "cotizacion",
        init: CotizacionController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainCotizacion());
        });
  }
}

class MainCotizacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController =
        RefreshController(initialRefresh: false);
    void onRefresh() async {
      try {
        refreshController.refreshCompleted();
      } catch (e) {
        refreshController.refreshFailed();
      }
    }

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return GetBuilder<CotizacionController>(
        id: "mainCotizacion",
        builder: (_) {
          _.getAllCotizacions();
          return Stack(
            children: [
              Scaffold(
                appBar: PreferredSize(
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          "assets/fondo/fondo.png",
                          width: Get.width,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 35, 20, 0),

                          //color: Colors.blue,

                          child: Column(
                            children: [
                              AppBarr(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  preferredSize: Size(Get.width, 70),
                ),
                body: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(),
                  controller: refreshController,
                  onRefresh: _.onRefresh,
                  onLoading: _.onLoading,
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          "assets/fondo/fondo.png",
                          width: Get.width,
                          height: Get.height,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        // Center is a layout widget. It takes a single child and positions it
                        // in the middle of the parent.
                        child: ExpandableTheme(
                            data: const ExpandableThemeData(
                              iconColor: Colors.blue,
                              useInkWell: true,
                            ),
                            child: ListCotizaciones()),
                      ),
                    ],
                  ),
                ),
              ),
              LoadingCotizacion()
            ],
          );
        });
  }
}

class ListCotizaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CotizacionController>(
        id: "listadoCotizaciones",
        builder: (_) {
          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: (_.listadoCotizacionWidget.length != 0)
                    ? _.listadoCotizacionWidget
                    : [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                          child: Column(children: [
                            Icon(Icons.list, size: 80, color: Colors.grey),
                            Text("No solicitudes de cotización",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ]),
                        ))
                      ],
              ));
        });
  }
}

class LoadingCotizacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CotizacionController>(
        id: "loading",
        builder: (_) {
          return (_.isLoading) ? Loading() : Container();
        });
  }
}
