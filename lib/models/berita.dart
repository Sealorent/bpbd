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
  List<BeritaData>? data;

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        success: json["success"],
        message: json["message"],
        data: List<BeritaData>.from(
            json["data"].map((x) => BeritaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BeritaData {
  BeritaData({
    this.title,
    this.deskripsi,
    this.kategoriId,
    this.userId,
    this.updatedAt,
    this.id,
    this.name,
  });

  String? title;
  String? deskripsi;
  int? kategoriId;
  int? userId;
  DateTime? updatedAt;
  int? id;
  String? name;

  factory BeritaData.fromJson(Map<String, dynamic> json) => BeritaData(
        title: json["title"],
        deskripsi: json["deskripsi"],
        kategoriId: json["kategori_id"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "deskripsi": deskripsi,
        "kategori_id": kategoriId,
        "user_id": userId,
        "updated_at": updatedAt!.toIso8601String(),
        "id": id,
        "name": name,
      };
}
