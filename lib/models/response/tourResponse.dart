// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:gotravelclub/models/request/tour.dart';

TourResponse tourResponseFromJson(String str) => TourResponse.fromJson(json.decode(str));

String tourResponseToJson(TourResponse data) => json.encode(data.toJson());

class TourResponse {
  TourResponse({
    this.data,
    this.popular,
    this.end,
    this.config,
  });

  List<Tour>? data;
  List<Tour>? popular;
  bool? end;
  Config? config;

  factory TourResponse.fromJson(Map<String, dynamic> json) => TourResponse(
    data: List<Tour>.from(json["data"].map((x) => Tour.fromJson(x))),
    popular: List<Tour>.from(json["popular"].map((x) => Tour.fromJson(x))),
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




