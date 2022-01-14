import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/models/response/alojamientoResponse.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';

class AlojamientoService {
  Dio _client;

  AlojamientoService(this._client){
    this._client.options.headers["authorization"]="Token ${PreferenceUtils.getString("token")}";

  }

  Future<AlojamientoResponse> getAlojamientos(int page) async {

    try{
      var formData = FormData.fromMap({"page":page});
      final response = await _client.post('/api/v1/get_accommodations/',data: formData);

      print(response);
      // It's better to return a Model class instead but this is
      // only for example purposes only
      return AlojamientoResponse.fromJson(jsonDecode(response.toString()));
    }
    on DioError catch(ex){
      // Assuming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception("errorMessage");
    }
  }
}