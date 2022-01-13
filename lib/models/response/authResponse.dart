import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.status,
    this.message,
    this.token,
    this.role,
    this.cedula,
  });

  bool? status;
  String? message;
  String? token;
  List<dynamic>? role;
  String? cedula;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    role: (json["role"]!=null)?List<dynamic>.from(json["role"].map((x) => x)):[],
    cedula: json["cedula"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "role": List<dynamic>.from(role!.map((x) => x)),
    "cedula": cedula,
  };
}
