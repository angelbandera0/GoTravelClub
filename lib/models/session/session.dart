import 'package:gotravelclub/models/request/rol.dart';

class Session {
  String? username;
  String? token;
  String? cedula;

  Session({
    this.username,
    this.token,
    this.cedula,
  });

  Session.fromJsonMap(Map<String, dynamic> json) {
    username = json['username'];
    token = json['token'];
    cedula = json['cedula'];
  }

  Map<String, dynamic> toJson() =>{
    'username':this.username,
    'token':this.token,
    'cedula':this.cedula,
  };

}
