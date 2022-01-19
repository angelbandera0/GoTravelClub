

class AlojamientoRequest {
  AlojamientoRequest({
    required this.pk,
    required this.cedula,
    required this.registration_id,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.dateBeginning,
    required this.dateEnd,
    required this.comments,
    required this.dataRooms,
  });

  String pk;
  String cedula;
  String registration_id;
  String fullname;
  String email;
  String phone;
  String dateBeginning;
  String dateEnd;
  String comments;
  String dataRooms;

  factory AlojamientoRequest.fromJson(Map<String, dynamic> json) =>
      AlojamientoRequest(
          pk: json["pk"],
          cedula: json["cedula"],
          registration_id: json["registration_id"],
          fullname: json["fullname"],
          email: json["email"],
          phone: json["phone"],
          dateBeginning: json["dateBeginning"],
          dateEnd: json["dateEnd"],
          comments: json["comments"],
          dataRooms: json["dataRooms"]
      );

  Map<String, dynamic> toJson() => {
        "pk":pk,
        "cedula":cedula,
        "registration_id":registration_id,
        "fullname":fullname,
        "email":email,
        "phone":phone,
        "dateBeginning":dateBeginning,
        "dateEnd":dateEnd,
        "comments":comments,
        "dataRooms":dataRooms,
      };
}
