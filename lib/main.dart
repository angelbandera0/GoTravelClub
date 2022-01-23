import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/sessionController.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';
import 'controller/drawerController.dart';
import 'routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<MyDrawerController>(MyDrawerController());
  Get.put<SessionController>(SessionController());
  await PreferenceUtils.init();
  await dotenv.load(fileName: ".env");
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Introduction Screen is: ${PreferenceUtils.getBool("introScreen",false)}");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoTravelClub',
      initialRoute: (false)?"/intro":"/login",
      theme: ThemeData(fontFamily: 'Corbel'),
      getPages: appRoutes,
    );
  }
}
