import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gotravelclub/models/request/user.dart';
import 'package:gotravelclub/models/response/authResponse.dart';

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
}