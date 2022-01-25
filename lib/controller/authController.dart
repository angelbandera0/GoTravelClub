import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/controller/sessionController.dart';
import 'package:gotravelclub/dio/dio_client.dart';
import 'package:gotravelclub/helper/notification.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/models/response/authResponse.dart';
import 'package:gotravelclub/models/response/quoteResponse.dart';
import 'package:gotravelclub/models/session/session.dart';
import 'package:gotravelclub/services/auth_service.dart';

import 'loadingController.dart';

class AuthController extends GetxController {
  AuthService auth = AuthService(new DioClient().init());
  TextEditingController _userCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();
  late MyDrawerController drawerController;




  late Notificacion _notificacion;
  late SessionController sessionController;
  late bool _isLoading;

  get isLoading => _isLoading;

  get userCtrl => _userCtrl;

  get passCtrl => _passCtrl;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isLoading = false;
    _notificacion = new Notificacion();
    drawerController = Get.find<MyDrawerController>();
    sessionController = Get.find<SessionController>();
  }

  Future<Session> login(String username, String password) async {
    try {
      toggleLoading();
      User u = User(username: username, password: password);
      AuthResponse response = await auth.login(u);
      if (response.status!) {
        sessionController.storageSession(Session(
          username: username,
          token: response.token,
          cedula: response.cedula,
          first_name: response.first_name,
          last_name: response.last_name,
        ));
        print(sessionController
            .getSession()
            .username);
        print(sessionController
            .getSession()
            .token);
        print(sessionController
            .getSession()
            .cedula);
        toggleLoading();
        Get.offNamed("/alojamiento");
      } else {
        toggleLoading();
        passCtrl.text = "";
        _notificacion.notificar(body: response.message!, type: "error");
      }
    } catch (error) {
      toggleLoading();
      passCtrl.text = "";
      _notificacion.notificar(body: "Ha ocurrido un error.", type: "error");
    }

    return sessionController.getSession();
  }

  void logout() {
    sessionController.logoutSession();
  }

  void setPasswordU(String pass,String pass1) async {
    if(pass==pass1) {
      toggleLoading();
      var response = await auth.setPasswordUser(pass);
      toggleLoading();
      _notificacion.notificar(body: response["message"],
          type: (response["message"] == "Contraseña cambiada correctamente")
              ? "success"
              : "error");
      if(response["message"] == "Contraseña cambiada correctamente"){
        drawerController.setCurrentIndex(0);
        Get.offNamed("/alojamiento");
      }
    }
    else{
      _notificacion.notificar(body: "Las contraseñas no coinciden",
          type: "error");
    }
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    update(["loading"]);
  }
}
