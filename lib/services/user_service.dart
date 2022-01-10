import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gotravelclub/helper/enviroment.dart';
import 'package:gotravelclub/models/request/user.dart';

class UserService {

  final Dio _dio = Dio(

  );

// TODO: Add methods

  Future<dynamic> postUser(dynamic user) async {
    // Perform GET request to the endpoint "/users/<id>"
    print(Enviroment().serverRoute());
    print(user);
    Response userData = await _dio.post('${Enviroment().serverRoute()}/api/users', data: user);

    // Prints the raw data returned by the server
    print('User Info: ${userData.data}');

    // Parsing the raw JSON data to the User class
    //User user = User.fromJson(userData.data);

    return 0;
  }
}
