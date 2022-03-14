import 'package:gotravelclub/models/request/rol.dart';

class Session {
  String? username;
  String? token;
  String? cedula;
  String? first_name;
  String? last_name;
  String? phone;
  String? email;

  Session(
      {this.username,
      this.token,
      this.cedula,
      this.first_name,
      this.last_name,
      this.phone,
      this.email});

  Session.fromJsonMap(Map<String, dynamic> json) {
    username = json['username'];
    token = json['token'];
    cedula = json['cedula'];
    first_name = json["first_name"];
    last_name = json["last_name"];
    phone = json["phone"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() => {
        'username': this.username,
        'token': this.token,
        'cedula': this.cedula,
        "first_name": this.first_name,
        "last_name": this.last_name,
        "phone": this.phone,
        "email": this.email
      };
}
