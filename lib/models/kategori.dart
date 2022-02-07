// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

import 'dart:convert';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

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
    this.createdAt,
    this.updatedAt,
    this.mitigasi,
  });

  int? id;
  String? name;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? mitigasi;

  factory KategoriData.fromJson(Map<String, dynamic> json) => KategoriData(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        mitigasi: json["mitigasi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "mitigasi": mitigasi,
      };
}
