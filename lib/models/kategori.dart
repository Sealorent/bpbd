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
  List<Datum>? data;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
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
    this.id,
    this.name,
    this.icon,
    this.linkEmbed,
    this.photos,
  });

  int? id;
  String? name;
  String? icon;
  String? linkEmbed;
  String? photos;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        linkEmbed: json["link_embed"],
        photos: json["photos"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "link_embed": linkEmbed,
        "photos": photos,
      };
}
