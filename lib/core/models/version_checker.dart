import 'dart:convert';

VersionChecker versionCheckerFromJson(dynamic str) {
  return VersionChecker.fromJson(str);
}

String versionCheckerToJson(VersionChecker data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class VersionChecker {
  num version;
  String link;
  bool isCompulsory;

  VersionChecker({
    this.version,
    this.link,
    this.isCompulsory = false,
  });

  factory VersionChecker.fromJson(Map<String, dynamic> json) => VersionChecker(
        version: json["version"]?.toDouble() ?? 0.0,
        link: json["link"] ?? "",
        isCompulsory: json["isCompulsory"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "link": link,
        "isCompulsory": isCompulsory ?? false,
      };
}
