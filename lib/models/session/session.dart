import 'package:gotravelclub/models/request/rol.dart';

class Session {
  String? username;
  String? token;
  String? cedula;
  String? first_name;
  String? last_name;

  Session({
    this.username,
    this.token,
    this.cedula,
    this.first_name,
    this.last_name

  });

  Session.fromJsonMap(Map<String, dynamic> json) {
    username = json['username'];
    token = json['token'];
    cedula = json['cedula'];
    first_name= json["first_name"];
    last_name= json["last_name"];
  }

  Map<String, dynamic> toJson() =>{
    'username':this.username,
    'token':this.token,
    'cedula':this.cedula,
    "first_name": first_name,
    "last_name": last_name,
  };

}
