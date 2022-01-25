import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/bottomController.dart';
import 'package:gotravelclub/controller/sessionController.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'controller/drawerController.dart';
import 'controller/routerController.dart';
import 'routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<MyDrawerController>(MyDrawerController());
  Get.put<SessionController>(SessionController());
  Get.put<BottomController>(BottomController());
  Get.put<RouterController>(RouterController());
  await PreferenceUtils.init();
  await dotenv.load(fileName: ".env");
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late BottomController btc;
  late RouterController rt;
  MyApp({Key? key}) : super(key: key){
    btc=Get.find<BottomController>();
    rt=Get.find<RouterController>();
  }
  @override
  Widget build(BuildContext context) {
    print("Introduction Screen is: ${PreferenceUtils.getBool("introScreen",false)}");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoTravelClub',
        routingCallback: (routing) {
          //print(routing!.current);
          //print(routing!.route.toString());

         // rt.setPrevR(rt.currentR);
        //rt.setCurrentR(routing!.current);
        //btc.updatedBottom(routing!.current);
        },
      initialRoute: (false)?"/intro":"/login",
      theme: ThemeData(fontFamily: 'Corbel'),
      getPages: appRoutes,
      localizationsDelegates: [
        // this line is important
        RefreshLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es'),

      ],
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale>? supportedLocales) {
        //print("change language");
        return locale;
      },

    );
  }
}
