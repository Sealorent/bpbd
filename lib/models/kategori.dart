// To parse this JSON data, do
//
//     final Kategori = KategoriFromJson(jsonString);

import 'dart:convert';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String KategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  Kategori({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<KategoriData>? data;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        success: json["success"],
        message: json["message"],
        data: List<KategoriData>.from(
            json["data"].map((x) => KategoriData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class KategoriData {
  KategoriData({
    this.id,
    this.name,
    this.icon,
    // this.Kategori,
    this.mitigasi,
  });

  int? id;
  String? name;
  String? icon;
  // String? Kategori;
  String? mitigasi;

  factory KategoriData.fromJson(Map<String, dynamic> json) => KategoriData(
      id: json["id"],
      name: json["name"],
      icon: json["icon"],
      // Kategori: json["Kategori"],
      mitigasi: json["mitigasi"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        // "Kategori": Kategori,
        "mitigasi": mitigasi,
      };
}
