
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/drawerController.dart';

class MenuScreen extends StatelessWidget {
  final widthBox = SizedBox(
    width: 16.0,
  );
  static List<MenuItem> mainMenu = [
    MenuItem("Alojamientos", Icons.home, 0,"/alojamiento"),
    MenuItem("Cotizaciones", Icons.money, 1,"/cotizaciones"),
    MenuItem("Escapadas", Icons.place, 2,"/escapada"),
    MenuItem("Tours", Icons.public, 3,"/tour"),
    MenuItem("Vuelos", Icons.flight, 4,"/vuelo"),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
        id: "drawer",
        builder: (_) {
          return Scaffold(
            backgroundColor: Color(0xff621771).withOpacity(0.3),
            body: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff621771).withOpacity(0.3), Color(0xff621771)..withOpacity(0.3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 24.0, left: 24.0, right: 24.0, top: 50),
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                "assets/splash.png",
                                width: 120,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 36.0, left: 24.0, right: 24.0, top: 0),
                        child: Text(
                          "UserName",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      MenuItemWidget(
                        item: mainMenu[0],
                        widthBox: widthBox,
                        selected: _.current==0,
                        callback: _.setCurrent,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      MenuItemWidget(
                        item: mainMenu[1],
                        widthBox: widthBox,
                        selected: _.current==1,
                        callback: _.setCurrent,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      MenuItemWidget(
                        item: mainMenu[2],
                        widthBox: widthBox,
                        selected: _.current==2,
                        callback: _.setCurrent,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      MenuItemWidget(
                        item: mainMenu[3],
                        widthBox: widthBox,
                        selected: _.current==3,
                        callback: _.setCurrent,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      MenuItemWidget(
                        item: mainMenu[4],
                        widthBox: widthBox,
                        selected: _.current==4,
                        callback: _.setCurrent,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      // Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 30),
                        child: OutlinedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Cerrar Sesión",
                              style: TextStyle(fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white, width: 2.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem? item;
  final Widget? widthBox;
  final TextStyle? style;
  final Function? callback;
  final bool? selected;

  final white = Colors.white;

  const MenuItemWidget({
    Key? key,
    this.item,
    this.widthBox,
    this.style,
    this.callback,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,

      child: TextButton(
        onPressed: () =>
            callback!(item!.index,item!.route),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: selected! ? Color(0x44000000) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                item!.icon,
                color: white,
                size: 30,
              ),
              widthBox!,
              Expanded(
                child: Text(
                  item!.title,
                  style: style,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final int index;
  final String route;

  const MenuItem(this.title, this.icon, this.index, this.route);
}

