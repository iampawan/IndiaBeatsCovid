import 'dart:convert';

List<MedicineSupply> medicineSupplyFromJson(dynamic str) {
  return List<MedicineSupply>.from(str.map((x) => MedicineSupply.fromJson(x)));
}

String medicineSupplyToJson(List<MedicineSupply> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class MedicineSupply {
  int id;
  String medicineName;
  String phone;
  String alternatePhone;
  String address;
  int cityId;
  String createdAt;
  dynamic lastVerifiedAt;

  MedicineSupply({
    this.id,
    this.medicineName,
    this.phone,
    this.alternatePhone,
    this.address,
    this.cityId,
    this.createdAt,
    this.lastVerifiedAt,
  });

  factory MedicineSupply.fromJson(Map<String, dynamic> json) => MedicineSupply(
        id: json["id"],
        medicineName: json["medicine_name"],
        phone: json["phone"],
        alternatePhone: json["alternate_phone"],
        address: json["address"],
        cityId: json["city_id"],
        createdAt: json["created_at"],
        lastVerifiedAt: json["last_verified_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "medicine_name": medicineName,
        "phone": phone,
        "alternate_phone": alternatePhone,
        "address": address,
        "city_id": cityId,
        "created_at": createdAt,
        "last_verified_at": lastVerifiedAt,
      };
}
