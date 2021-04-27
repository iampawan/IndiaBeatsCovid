import 'dart:convert';

List<HospitalBeds> hospitalBedsFromJson(dynamic res) {
  return List<HospitalBeds>.from(res.map((x) => HospitalBeds.fromJson(x)));
}

String hospitalBedsToJson(List<HospitalBeds> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class HospitalBeds {
  int id;
  String hospitalName;
  String contactName;
  String phone;
  String alternatePhone;
  String address;
  int cityId;
  int icuBeds;
  int beds;
  String lastVerifiedAt;
  String createdAt;

  HospitalBeds({
    this.id,
    this.hospitalName,
    this.contactName,
    this.phone,
    this.alternatePhone,
    this.address,
    this.cityId,
    this.icuBeds,
    this.beds,
    this.lastVerifiedAt,
    this.createdAt,
  });

  factory HospitalBeds.fromJson(Map<String, dynamic> json) => HospitalBeds(
        id: json["id"],
        hospitalName: json["hospital_name"],
        contactName: json["contact_name"],
        phone: json["phone"],
        alternatePhone: json["alternate_phone"],
        address: json["address"],
        cityId: json["city_id"],
        icuBeds: json["icu_beds"],
        beds: json["beds"],
        lastVerifiedAt: json["last_verified_at"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_name": hospitalName,
        "contact_name": contactName,
        "phone": phone,
        "alternate_phone": alternatePhone,
        "address": address,
        "city_id": cityId,
        "icu_beds": icuBeds,
        "beds": beds,
        "last_verified_at": lastVerifiedAt,
        "created_at": createdAt,
      };
}
