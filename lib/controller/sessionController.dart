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
    PreferenceUtils.setString("first_name", s.first_name!);
    PreferenceUtils.setString("last_name", s.last_name!);
    PreferenceUtils.setString("email", s.email!);
    PreferenceUtils.setString("phone", s.phone!);
  }

  Session getSession() {
    return Session(
      token: PreferenceUtils.getString("token"),
      cedula: PreferenceUtils.getString("cedula"),
      username: PreferenceUtils.getString("username"),
      first_name: PreferenceUtils.getString("first_name"),
      last_name: PreferenceUtils.getString("last_name"),
      email: PreferenceUtils.getString("email"),
      phone: PreferenceUtils.getString("phone"),
    );
  }

  void logoutSession() {
    PreferenceUtils.remove("token");
    PreferenceUtils.remove("cedula");
    PreferenceUtils.remove("username");
    PreferenceUtils.remove("first_name");
    PreferenceUtils.remove("last_name");
    PreferenceUtils.remove("phone");
    PreferenceUtils.remove("email");

    print(PreferenceUtils.getString("token"));
  }
}
