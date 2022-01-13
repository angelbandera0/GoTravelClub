import 'package:gotravelclub/models/request/rol.dart';

class Session {
  String? username;
  String? token;

  Session({
    this.username,
    this.token,
  });

  Session.fromJsonMap(Map<String, dynamic> json) {
    username = json['username'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() =>{
    'username':this.username,
    'token':this.token,
  };

}
