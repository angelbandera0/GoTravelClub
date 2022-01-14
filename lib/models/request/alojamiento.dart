class Alojamiento{
  Alojamiento({
    this.pk,
    this.imagen1,
    this.imagen2,
    this.imagen3,
    this.imagen4,
    this.name,
    this.info,
    this.country,
    this.state,
    this.city,
    this.numberQto,
  });

  String? pk;
  String? imagen1;
  String? imagen2;
  String? imagen3;
  String? imagen4;
  String? name;
  String? info;
  String? country;
  String? state;
  String? city;
  int? numberQto;

  factory Alojamiento.fromJson(Map<String, dynamic> json) => Alojamiento(
    pk: json["pk"],
    imagen1: json["imagen1"],
    imagen2: json["imagen2"],
    imagen3: json["imagen3"],
    imagen4: json["imagen4"],
    name: json["name"],
    info: json["info"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    numberQto: json["numberQto"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "imagen1": imagen1,
    "imagen2": imagen2,
    "imagen3": imagen3,
    "imagen4": imagen4,
    "name": name,
    "info": info,
    "country": country,
    "state": state,
    "city": city,
    "numberQto": numberQto,
  };
}