// To parse this JSON data, do
//
//     final berita = beritaFromJson(jsonString);

import 'dart:convert';

Berita beritaFromJson(String str) => Berita.fromJson(json.decode(str));

String beritaToJson(Berita data) => json.encode(data.toJson());

class Berita {
  Berita({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.title,
    this.linkArtikel,
    this.cover,
    this.kategoriId,
    this.userId,
    this.createdAt,
    this.id,
    this.name,
  });

  String? title;
  String? linkArtikel;
  String? cover;
  int? kategoriId;
  int? userId;
  DateTime? createdAt;
  int? id;
  String? name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        linkArtikel: json["link_artikel"],
        cover: json["cover"],
        kategoriId: json["kategori_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link_artikel": linkArtikel,
        "cover": cover,
        "kategori_id": kategoriId,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "name": name,
      };
}
