import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/models/response/authResponse.dart';
import 'package:gotravelclub/models/response/quoteResponse.dart';
import 'package:gotravelclub/shared_preferences/shared_preferences_singlenton.dart';

class AuthService {
  Dio _client;

  AuthService(this._client);

  Future<AuthResponse> login(User user) async {

    try{
      var formData = (user.username!="" && user.password!="")?FormData.fromMap(user.toJson()):null;
      final response = await _client.post('/api/v1/auth/',data: formData);

      print(response);
      // It's better to return a Model class instead but this is
      // only for example purposes only
      return AuthResponse.fromJson(jsonDecode(response.toString()));
    }
    on DioError catch(ex){
      // Assuming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception("errorMessage");
    }
  }
  Future<dynamic> setPasswordUser(String password) async {

    try{
      this._client.options.headers["authorization"] =
      "Token ${PreferenceUtils.getString("token")}";
      var formData = FormData.fromMap({"cedula": PreferenceUtils.getString("cedula"),"password":password});
      final response = await _client.post('/api/v1/set_change_password/',data: formData);

      print(jsonDecode(response.toString())["message"]);
      // It's better to return a Model class instead but this is
      // only for example purposes only
      return jsonDecode(response.toString());
    }
    on DioError catch(ex){
      // Assuming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception("errorMessage");
    }
  }
}