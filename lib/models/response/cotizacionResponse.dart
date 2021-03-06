// To parse this JSON data, do
//
//     final cotizacionResponse = cotizacionResponseFromJson(jsonString);

import 'dart:convert';

CotizacionResponse cotizacionResponseFromJson(String str) =>
    CotizacionResponse.fromJson(json.decode(str));

String cotizacionResponseToJson(CotizacionResponse data) =>
    json.encode(data.toJson());

class CotizacionResponse {
  CotizacionResponse({
    this.info,
    this.status,
  });

  List<Info>? info;
  bool? status;

  factory CotizacionResponse.fromJson(Map<String, dynamic> json) =>
      CotizacionResponse(
        info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "info": List<dynamic>.from(info!.map((x) => x.toJson())),
        "status": status,
      };
}

class Info {
  Info(
      {this.type,
      this.pk,
      this.status,
      this.title,
      this.name,
      this.email,
      this.phone,
      this.dateFrom,
      this.dateTo,
      this.rooms,
      this.observation,
      this.isValidate,
      this.ammount,
      this.isPayment,
      this.infopayment,
      this.response,
      this.airportorigen,
      this.airportdestiny,
      this.clase});

  int? type;
  int? pk;
  String? status;
  String? title;
  String? name;
  String? email;
  String? phone;
  //only fly
  String? airportorigen;
  String? airportdestiny;
  String? clase;
  //
  DateTime? dateFrom;
  DateTime? dateTo;
  List<Room>? rooms;
  String? observation;
  bool? isValidate;
  double? ammount;
  bool? isPayment;
  Infopayment? infopayment;
  String? response;

  factory Info.fromJson(Map<String, dynamic> json) {
    List<Room> rooms = [];
    if (json["type"] == 4) {
      //rooms.add(Room(countAdults: int.parse(json["count_adults"].toString().replaceAll("\\", "").replaceAll("n", "")),
      //agesMinors: json["ages_minors"]));
      print(json["airportorigen"]);
    }
    return Info(
      type: json["type"],
      pk: json["pk"],
      status: json["status"],
      title: json["title"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      dateFrom: DateTime.parse(json["dateFrom"]),
      dateTo: (json["dateTo"] != "") ? DateTime.parse(json["dateTo"]) : null,
      rooms: (json["type"] == 4)
          ? [
              Room(agesMinors: [4, 5, 5], countAdults: 3)
            ]
          : List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
      observation: json["observation"],
      isValidate: json["is_validate"],
      ammount: json["ammount"],
      isPayment: json["is_payment"],
      infopayment: Infopayment.fromJson(json["infopayment"]),
      response: json["response"],
      airportorigen: (json["type"] == 4) ? json["airportorigen"] : "",
      airportdestiny: (json["type"] == 4) ? json["airportdestiny"] : "",
      clase: (json["type"] == 4) ? json["clase"] : "",
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "pk": pk,
        "status": status,
        "title": title,
        "name": name,
        "email": email,
        "phone": phone,
        "dateFrom":
            "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
        "dateTo":
            "${dateTo!.year.toString().padLeft(4, '0')}-${dateTo!.month.toString().padLeft(2, '0')}-${dateTo!.day.toString().padLeft(2, '0')}",
        "rooms": List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "observation": observation,
        "is_validate": isValidate,
        "ammount": ammount,
        "is_payment": isPayment,
        "infopayment": infopayment!.toJson(),
        "response": response,
      };
}

class Infopayment {
  String? date_payment;
  String? payment_state;
  String? amount;
  String? currency_code;
  String? short_description;

  factory Infopayment.fromJson(Map<String, dynamic> json) => Infopayment(
        date_payment: json["date_payment"],
        payment_state: json["payment_state"],
        amount: json["amount"],
        currency_code: json["currency_code"],
        short_description: json["short_description"],
      );

  Infopayment(
      {this.date_payment,
      this.payment_state,
      this.amount,
      this.currency_code,
      this.short_description});

  Map<String, dynamic> toJson() => {
        "date_payment": date_payment,
        "payment_state": payment_state,
        "amount": amount,
        "currency_code": currency_code,
        "short_description": short_description,
      };
}

class Room {
  Room({
    this.countAdults,
    this.agesMinors,
  });

  int? countAdults;
  List<int>? agesMinors;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        countAdults: json["count_adults"],
        agesMinors: List<int>.from(json["ages_minors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count_adults": countAdults,
        "ages_minors": List<dynamic>.from(agesMinors!.map((x) => x)),
      };
}
