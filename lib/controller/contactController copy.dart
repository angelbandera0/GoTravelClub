import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DevsController extends GetxController {
  String versionapp = "";
  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String code = packageInfo.buildNumber;
    versionapp = version;
    update(["maindevs"]);
  }

  @override
  onInit() {
    super.onInit();
    getVersion();
  }
}
