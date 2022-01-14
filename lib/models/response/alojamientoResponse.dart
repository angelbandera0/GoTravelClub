// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:gotravelclub/models/request/alojamiento.dart';

AlojamientoResponse alojamientoResponseFromJson(String str) => AlojamientoResponse.fromJson(json.decode(str));

String alojamientoResponseToJson(AlojamientoResponse data) => json.encode(data.toJson());

class AlojamientoResponse {
  AlojamientoResponse({
    this.data,
    this.popular,
    this.end,
    this.config,
  });

  List<Alojamiento>? data;
  List<Alojamiento>? popular;
  bool? end;
  Config? config;

  factory AlojamientoResponse.fromJson(Map<String, dynamic> json) => AlojamientoResponse(
    data: List<Alojamiento>.from(json["data"].map((x) => Alojamiento.fromJson(x))),
    popular: List<Alojamiento>.from(json["popular"].map((x) => Alojamiento.fromJson(x))),
    end: json["end"],
    config: Config.fromJson(json["config"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "popular": List<dynamic>.from(popular!.map((x) => x.toJson())),
    "end": end,
    "config": config!.toJson(),
  };
}

class Config {
  Config({
    this.versionApk,
    this.out,
  });

  String? versionApk;
  bool? out;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
    versionApk: json["version_apk"],
    out: json["out"],
  );

  Map<String, dynamic> toJson() => {
    "version_apk": versionApk,
    "out": out,
  };
}




