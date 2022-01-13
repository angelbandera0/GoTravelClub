import 'dart:async';
import "package:dio/dio.dart";
import 'package:gotravelclub/dio/api_interceptor.dart';
import 'package:gotravelclub/helper/enviroment.dart';

class DioClient{
  Dio init() {
    Dio _dio = new Dio();
    _dio.interceptors.add(new ApiInterceptor());
    _dio.options.baseUrl = Enviroment().serverRoute()!;
    return _dio;
  }
}

