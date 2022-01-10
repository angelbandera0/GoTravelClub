import 'package:gotravelclub/models/request/rol.dart';

class User {
  int? id;
  String? name;
  String? password;
  String? passwordHash;
  String? email;
  Rol? rol;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  User({this.id,
    this.name,
    this.password,
    this.passwordHash,
    this.email,
    this.rol,
    this.isVerified,
    this.createdAt,
    this.updatedAt
  });

  User.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    passwordHash = json['passwordHash'];
    email = json['email'];
    rol = json['rol'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedA'];
  }

  Map<String, dynamic> toJson() =>{
    'id': this.id,
    'name':this.name,
    'password':this.password,
    'passwordHash':this.passwordHash,
    'email':this.email,
    'rol':this.rol,
    'isVerified':this.isVerified,
    'createdAt':this.createdAt,
    'updatedAt':this.updatedAt
  };

}
