import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/models/session/session.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';

class SessionController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  void storageSession(Session s) {
    PreferenceUtils.setString("username", s.username!);
    PreferenceUtils.setString("token", s.token!);
    PreferenceUtils.setString("cedula", s.cedula!);
  }

  Session getSession() {
    return Session(
        token: PreferenceUtils.getString("token"),
        cedula: PreferenceUtils.getString("cedula"),
        username: PreferenceUtils.getString("username"));
  }

  void logoutSession() {
    PreferenceUtils.remove("token");
    PreferenceUtils.remove("cedula");
    PreferenceUtils.remove("username");
    print(PreferenceUtils.getString("token"));
  }
}
