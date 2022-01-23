import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AboutController extends GetxController {

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}