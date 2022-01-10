import 'package:dio/dio.dart';
import 'package:gotravelclub/dio/auth_interceptor.dart';
import 'package:gotravelclub/helper/enviroment.dart';

class AuthService {
  final Dio _dio = Dio(
   /* BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),*/
  );
    //..interceptors.add(AuthInterceptor());

  final _baseUrl = 'https://reqres.in/api';

// TODO: Add methods

  Future<dynamic> login(Map<String,dynamic>? ma) async {
    // Perform GET request to the endpoint "/users/<id>"
    Response userData = await _dio.post('${Enviroment().serverRoute()}/api/auth/login',data: ma);

    // Prints the raw data returned by the server
    print('User Info: ${userData.data}');

    // Parsing the raw JSON data to the User class
    //User user = User.fromJson(userData.data);

    return 0;
  }
}