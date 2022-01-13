import 'package:gotravelclub/models/request/rol.dart';

class User {
  String? username;
  String? password;

  User({
    this.username,
    this.password,
  });

  User.fromJsonMap(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() =>{
    'username':this.username,
    'password':this.password,
  };

}
