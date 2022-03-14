import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse(
      {this.status,
      this.message,
      this.token,
      this.role,
      this.cedula,
      this.username,
      this.first_name,
      this.last_name,
      this.phone,
      this.email});

  bool? status;
  String? message;
  String? token;
  List<dynamic>? role;
  String? cedula;
  String? username;
  String? first_name;
  String? last_name;
  String? phone;
  String? email;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json["status"],
      message: json["message"],
      token: json["token"],
      role: (json["role"] != null)
          ? List<dynamic>.from(json["role"].map((x) => x))
          : [],
      cedula: json["cedula"],
      username: json["username"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      phone: json["phone"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "role": List<dynamic>.from(role!.map((x) => x)),
        "cedula": cedula,
        "username": username,
        "first_name": first_name,
        "last_name": last_name,
        "phone": phone,
        "email": email
      };
}
