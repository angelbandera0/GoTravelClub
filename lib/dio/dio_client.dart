import 'dart:async';
import "package:dio/dio.dart";
import 'package:gotravelclub/dio/api_interceptor.dart';
import 'package:gotravelclub/helper/enviroment.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';

class DioClient{
  Dio init() {
    Dio _dio = new Dio();
    _dio.interceptors.add(new ApiInterceptor());
    _dio.options.baseUrl = Enviroment().serverRoute()!;
    return _dio;
  }
}

