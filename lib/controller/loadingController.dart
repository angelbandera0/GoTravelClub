import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController{
  bool _isLoading=false;

  get isLoading=>_isLoading;

  void start(){
    _isLoading=true;
    print(_isLoading);
    update(["loading"]);
  }
  void stop(){
    _isLoading=false;
    print(_isLoading);

    update(["loading"]);
  }
}