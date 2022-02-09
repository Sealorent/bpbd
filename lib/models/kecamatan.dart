// To parse this JSON data, do
//
//     final kecamatan = kecamatanFromJson(jsonString);

import 'dart:convert';

List<Kecamatan> kecamatanFromJson(String str) =>
    List<Kecamatan>.from(json.decode(str).map((x) => Kecamatan.fromJson(x)));

String kecamatanToJson(List<Kecamatan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kecamatan {
  Kecamatan({
    this.kecamatan,
    this.lat,
    this.long,
  });

  String? kecamatan;
  String? lat;
  String? long;

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        kecamatan: json["kecamatan"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "kecamatan": kecamatan,
        "lat": lat,
        "long": long,
      };
}
