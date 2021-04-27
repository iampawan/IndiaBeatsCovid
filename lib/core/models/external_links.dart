import 'dart:convert';

List<ExternalLinks> externalLinksFromJson(dynamic res) {
  return List<ExternalLinks>.from(res.map((x) => ExternalLinks.fromJson(x)));
}

String externalLinksToJson(List<ExternalLinks> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ExternalLinks {
  int id;
  String url;
  int cityId;
  String title;
  String description;
  String favicon;
  String createdAt;

  ExternalLinks({
    this.id,
    this.url,
    this.cityId,
    this.title,
    this.description,
    this.favicon,
    this.createdAt,
  });

  factory ExternalLinks.fromJson(Map<String, dynamic> json) => ExternalLinks(
        id: json["id"],
        url: json["url"],
        cityId: json["city_id"],
        title: json["title"],
        description: json["description"],
        favicon: json["favicon"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "city_id": cityId,
        "title": title,
        "description": description,
        "favicon": favicon,
        "created_at": createdAt,
      };
}
