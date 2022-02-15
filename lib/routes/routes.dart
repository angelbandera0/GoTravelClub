import 'package:get/get.dart';
import 'package:gotravelclub/views/alojamiento/alojamiento.dart';
import 'package:gotravelclub/views/alojamiento/detalles_alojamiento.dart';
import 'package:gotravelclub/views/auth/login.dart';
import 'package:gotravelclub/views/auth/register.dart';
import 'package:gotravelclub/views/auth/setpassword.dart';
import 'package:gotravelclub/views/dev/dev_info.dart';
import 'package:gotravelclub/views/escapada/detalles_escapada.dart';
import 'package:gotravelclub/views/escapada/escapada.dart';
import 'package:gotravelclub/views/inicio/inicio.dart';
import 'package:gotravelclub/views/introduction/intro.dart';
import 'package:gotravelclub/views/listado_cotizacion/listado.dart';
import 'package:gotravelclub/views/mantenimiento.dart';
import 'package:gotravelclub/views/tour/detalles_tour.dart';
import 'package:gotravelclub/views/tour/tour.dart';
import 'package:gotravelclub/views/vuelo/vuelo.dart';
import 'package:gotravelclub/views/about/about.dart';
import 'package:gotravelclub/views/contactenos/contact.dart';

final List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: '/intro',
    page: () => OnBoardingPage(),
    //transition: Transition.noTransition
  ),
  GetPage(
    name: '/about',
    page: () => About(),
    //transition: Transition.noTransition
  ),
  GetPage(
    name: '/contact',
    page: () => Contact(),
    //transition: Transition.noTransition
  ),
  GetPage(
    name: '/devs',
    page: () => DevInfo(),
    //transition: Transition.noTransition
  ),
  GetPage(
    name: '/inicio',
    page: () => Inicio(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/alojamiento',
    page: () => Alojamiento(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/alojamientoDetalles',
    page: () => DetallesAlojamiento(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/tourDetalles',
    page: () => DetallesTour(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/escapadaDetalles',
    page: () => DetallesEscapada(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/tour',
    page: () => Tour(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/escapada',
    page: () => Escapada(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/vuelo',
    page: () => Vuelo(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/login',
    page: () => Login(),
    //transition: Transition.noTransition
  ),
  GetPage(
    name: '/setpassword',
    page: () => SetPassword(),
    //transition: Transition.noTransition
  ),
  GetPage(
    name: '/register',
    page: () => Register(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/cotizaciones',
    page: () => Listado(),
    //    transition: Transition.noTransition
  ),
  GetPage(
    name: '/mantenimiento',
    page: () => Mantenimiento(),
    //    transition: Transition.noTransition
  ),
];
