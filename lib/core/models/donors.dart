import 'dart:convert';

List<Donors> donorsFromJson(dynamic res) {
  return List<Donors>.from(res.map((x) => Donors.fromJson(x)));
}

String donorsToJson(List<Donors> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Donors {
  int id;
  String name;
  String phone;
  String alternatePhone;
  String bloodGroup;
  int cityId;
  String address;
  int pincode;
  String lastVerifiedAt;
  String createdAt;

  Donors({
    this.id,
    this.name,
    this.phone,
    this.alternatePhone,
    this.bloodGroup,
    this.cityId,
    this.address,
    this.pincode,
    this.lastVerifiedAt,
    this.createdAt,
  });

  factory Donors.fromJson(Map<String, dynamic> json) => Donors(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        alternatePhone: json["alternate_phone"],
        bloodGroup: json["blood_group"],
        cityId: json["city_id"],
        address: json["address"],
        pincode: json["pincode"],
        lastVerifiedAt: json["last_verified_at"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "alternate_phone": alternatePhone,
        "blood_group": bloodGroup,
        "city_id": cityId,
        "address": address,
        "pincode": pincode,
        "last_verified_at": lastVerifiedAt,
        "created_at": createdAt,
      };
}
