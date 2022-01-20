// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

QuoteResponse quoteResponseFromJson(String str) => QuoteResponse.fromJson(json.decode(str));

String quoteResponseToJson(QuoteResponse data) => json.encode(data.toJson());

class QuoteResponse {
  QuoteResponse({
    required this.state,
     this.message,
     this.type,
  });

  bool state;
  dynamic? message;
  String? type;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) => QuoteResponse(
    state: json["state"],
    type: json["type"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "type": type,
    "message": message,
  };
}
