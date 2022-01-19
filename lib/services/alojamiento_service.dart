import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/models/response/alojamientoResponse.dart';
import 'package:gotravelclub/models/response/quoteResponse.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';

class AlojamientoService {
  Dio _client;

  AlojamientoService(this._client) {
    this._client.options.headers["authorization"] =
        "Token ${PreferenceUtils.getString("token")}";
  }

  Future<AlojamientoResponse> getAlojamientos(int page) async {
    try {
      var formData = FormData.fromMap({"page": page});
      final response =
          await _client.post('/api/v1/get_accommodations/', data: formData);
      return AlojamientoResponse.fromJson(jsonDecode(response.toString()));
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception("errorMessage");
    }
  }

  Future<QuoteResponse> sendCuota(Map<String, dynamic> map) async {
    try {
      var formD = FormData.fromMap(map);
      final response =
          await _client.post('/api/v1/set_quote_accommodation/', data: formD);
      return QuoteResponse.fromJson(jsonDecode(response.toString()));
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception("errorMessage");
    }
  }

  Future<AlojamientoResponse> findAlojamientos(String search) async {
    try {
      var formData =
          FormData.fromMap({"type": "accommodations", "search": search});
      final response = await _client.post('/api/v1/find/', data: formData);
      return AlojamientoResponse.fromJson(jsonDecode(response.toString()));
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception("errorMessage");
    }
  }
}
