// // To parse this JSON data, do
// //
// //     final berita = beritaFromJson(jsonString);

// import 'dart:convert';

// Berita beritaFromJson(String str) => Berita.fromJson(json.decode(str));

// String beritaToJson(Berita data) => json.encode(data.toJson());

// class Berita {
//   Berita({
//     this.success,
//     this.message,
//     this.data,
//   });

//   bool? success;
//   String? message;
//   List<BeritaData>? data;

//   factory Berita.fromJson(Map<String, dynamic> json) => Berita(
//         success: json["success"],
//         message: json["message"],
//         data: List<BeritaData>.from(
//             json["data"].map((x) => BeritaData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class BeritaData {
//   BeritaData({
//     this.title,
//     this.link_artikel,
//     this.cover,
//     this.kategoriId,
//     this.userId,
//     this.createdAt,
//     this.id,
//     this.name,
//   });

//   String? title;
//   String? link_artikel;
//   String? cover;
//   int? kategoriId;
//   int? userId;
//   DateTime? createdAt;
//   int? id;
//   String? name;

//   factory BeritaData.fromJson(Map<String, dynamic> json) => BeritaData(
//         title: json["title"],
//         link_artikel: json["link_artikel"],
//         cover: json["cover"],
//         kategoriId: json["kategori_id"],
//         userId: json["user_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "link_artikel": link_artikel,
//         "cover": cover,
//         "kategori_id": kategoriId,
//         "user_id": userId,
//         "updated_at": createdAt!.toIso8601String(),
//         "id": id,
//         "name": name,
//       };
// }

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
  String? kategoriId;
  String? userId;
  DateTime? createdAt;
  int? id;
  String? name;

  factory BeritaData.fromJson(Map<String, dynamic> json) => BeritaData(
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
