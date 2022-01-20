import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/models/response/airportResponse.dart';
import 'package:gotravelclub/models/response/quoteResponse.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';

class VueloService {
  Dio _client;

  VueloService(this._client) {
    this._client.options.headers["authorization"] =
    "Token ${PreferenceUtils.getString("token")}";
  }

  Future<AirportResponse> getAirports(String find) async {
    try {
      var formData = FormData.fromMap({"find": find});
      final response =
      await _client.post('/api/v1/get_airport/', data: formData);
      return AirportResponse.fromJson(jsonDecode(response.toString()));
    } on DioError catch (ex) {
      throw new Exception("errorMessage");
    }
  }

  Future<QuoteResponse> sendCuota(Map<String, dynamic> map) async {
    try {
      var formD = FormData.fromMap(map);
      final response =
      await _client.post('/api/v1/set_quote_flights/', data: formD);
      return QuoteResponse.fromJson(jsonDecode(response.toString()));
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      //String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception("errorMessage");
    }
  }


}
