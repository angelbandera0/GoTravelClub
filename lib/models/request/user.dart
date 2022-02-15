import 'package:gotravelclub/models/request/rol.dart';

class User {
  String? username;
  String? password;
  String? registration_id;

  User({
    this.username,
    this.password,
    this.registration_id,
  });

  User.fromJsonMap(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    registration_id = json['registration_id'];
  }

  Map<String, dynamic> toJson() => {
        'username': this.username,
        'password': this.password,
        'registration_id': this.registration_id,
      };
}
