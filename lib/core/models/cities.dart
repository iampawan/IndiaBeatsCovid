import 'dart:convert';

List<City> cityFromJson(dynamic res) {
  return List<City>.from(res.map((x) => City.fromJson(x)));
}

String cityToJson(List<City> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class City {
  int id;
  String name;

  City({
    this.id,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
