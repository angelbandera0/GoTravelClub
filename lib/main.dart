import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/bottomController.dart';
import 'package:gotravelclub/controller/sessionController.dart';
import 'package:gotravelclub/helper/notification.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'controller/drawerController.dart';
import 'controller/routerController.dart';
import 'routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<MyDrawerController>(MyDrawerController());
  Get.put<SessionController>(SessionController());
  Get.put<BottomController>(BottomController());
  Get.put<RouterController>(RouterController());
  await PreferenceUtils.init();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  PreferenceUtils.setString(
      "token_phone", await FirebaseMessaging.instance.getToken() ?? "");

  print("${PreferenceUtils.getString('token_phone')} tokenFirebaseMobile");
  runApp(MyAppPage());
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyAppPage> {
  // This widget is the root of your application.
  late BottomController btc;
  late RouterController rt;
  int _counter = 0;
  MyApp() {
    btc = Get.find<BottomController>();
    rt = Get.find<RouterController>();
  }
  @override
  Widget build(BuildContext context) {
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
      initialRoute: (false) ? "/intro" : "/login",
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

  @override
  void initState() {
    super.initState();
    Notificacion notificacion = Notificacion();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      notificacion.notificar(body: notification!.body!, type: "success");
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      notificacion.notificar(body: notification!.body!, type: "success");
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }
}
