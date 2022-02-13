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
  BeritaData(
      {this.title,
      this.link_artikel,
      this.kategoriId,
      this.userId,
      this.createdAt,
      this.id,
      this.name,
      this.cover});

  String? title;
  String? link_artikel;
  int? kategoriId;
  int? userId;
  String? createdAt;
  int? id;
  String? name;
  String? cover;

  factory BeritaData.fromJson(Map<String, dynamic> json) => BeritaData(
        title: json["title"],
        link_artikel: json["link_artikel"],
        kategoriId: json["kategori_id"],
        userId: json["user_id"],
        createdAt: json["created_at"].toString().substring(0, 10),
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link_artikel": link_artikel,
        "kategori_id": kategoriId,
        "user_id": userId,
        "updated_at": createdAt,
        "id": id,
        "name": name,
        "cover": cover,
      };
}
