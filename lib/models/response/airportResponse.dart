// To parse this JSON data, do
//
//     final airportResponse = airportResponseFromJson(jsonString);

import 'dart:convert';

AirportResponse airportResponseFromJson(String str) => AirportResponse.fromJson(json.decode(str));

String airportResponseToJson(AirportResponse data) => json.encode(data.toJson());

class AirportResponse {
  AirportResponse({
    this.result,
  });

  List<Airport>? result;

  factory AirportResponse.fromJson(Map<String, dynamic> json) => AirportResponse(
    result: List<Airport>.from(json["result"].map((x) => Airport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Airport {
  Airport({
    this.pk,
    this.name,
    this.iata,
    this.icao,
    this.country,
    this.state,
    this.city,
  });

  int? pk;
  String? name;
  String? iata;
  String? icao;
  String? country;
  String? state;
  String? city;

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
    pk: json["pk"],
    name: json["name"],
    iata: json["iata"],
    icao: json["icao"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "name": name,
    "iata": iata,
    "icao": icao,
    "country": country,
    "state": state,
    "city": city,
  };
}


