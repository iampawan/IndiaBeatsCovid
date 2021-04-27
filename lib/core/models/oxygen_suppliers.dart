import 'dart:convert';

List<OxygenSupplier> oxygenSupplierFromJson(dynamic res) {
  return List<OxygenSupplier>.from(res.map((x) => OxygenSupplier.fromJson(x)));
}

String oxygenSupplierToJson(List<OxygenSupplier> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class OxygenSupplier {
  int id;
  String name;
  String phone;
  String alternatePhone;
  String address;
  int cityId;
  String lastVerifiedAt;
  String createdAt;

  OxygenSupplier({
    this.id,
    this.name,
    this.phone,
    this.alternatePhone,
    this.address,
    this.cityId,
    this.lastVerifiedAt,
    this.createdAt,
  });

  factory OxygenSupplier.fromJson(Map<String, dynamic> json) => OxygenSupplier(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        alternatePhone: json["alternatePhone"]?.toString(),
        address: json["address"],
        cityId: json["city_id"],
        lastVerifiedAt: json["last_verified_at"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "alternate_phone": alternatePhone,
        "address": address,
        "city_id": cityId,
        "last_verified_at": lastVerifiedAt,
        "created_at": createdAt,
      };
}
