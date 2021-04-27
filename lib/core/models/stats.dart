import 'dart:convert';

Stats statsFromJson(String str) {
  final jsonData = json.decode(str);
  return Stats.fromJson(jsonData);
}

String statsToJson(Stats data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Stats {
  Total plasmaDonors;
  Total hospitalBeds;
  Total oxygenSuppliers;
  Total medicines;

  Stats({
    this.plasmaDonors,
    this.hospitalBeds,
    this.oxygenSuppliers,
    this.medicines,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        plasmaDonors: Total.fromJson(json["plasma_donors"]),
        hospitalBeds: Total.fromJson(json["hospital_beds"]),
        oxygenSuppliers: Total.fromJson(json["oxygen_suppliers"]),
        medicines: Total.fromJson(json["medicines"]),
      );

  Map<String, dynamic> toJson() => {
        "plasma_donors": plasmaDonors.toJson(),
        "hospital_beds": hospitalBeds.toJson(),
        "oxygen_suppliers": oxygenSuppliers.toJson(),
        "medicines": medicines.toJson(),
      };
}

class Total {
  int total;
  String lastUpdated;

  String get formattedTime => lastUpdated;

  Total({
    this.total,
    this.lastUpdated,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        total: json["total"],
        lastUpdated: json["last_updated"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "last_updated": lastUpdated,
      };
}
