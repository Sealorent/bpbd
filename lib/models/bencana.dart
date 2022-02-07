// To parse this JSON data, do
//
//     final bencana = bencanaFromJson(jsonString);

import 'dart:convert';

Bencana bencanaFromJson(String str) => Bencana.fromJson(json.decode(str));

String bencanaToJson(Bencana data) => json.encode(data.toJson());

class Bencana {
  Bencana({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<BencanaData>? data;

  factory Bencana.fromJson(Map<String, dynamic> json) => Bencana(
        success: json["success"],
        message: json["message"],
        data: List<BencanaData>.from(
            json["data"].map((x) => BencanaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BencanaData {
  BencanaData({
    this.id,
    this.idKategoriBencana,
    this.deskripsi,
    this.longitude,
    this.latitude,
    this.gambar,
    this.idAdmin,
    this.idUser,
    this.status,
    this.createdAt,
    this.idKategori,
    this.name,
    this.icon,
  });

  int? id;
  int? idKategoriBencana;
  String? deskripsi;
  String? longitude;
  String? latitude;
  String? gambar;
  int? idAdmin;
  dynamic? idUser;
  dynamic? status;
  DateTime? createdAt;
  int? idKategori;
  String? name;
  String? icon;

  factory BencanaData.fromJson(Map<String, dynamic> json) => BencanaData(
        id: json["id"],
        idKategoriBencana: json["id_kategori_bencana"],
        deskripsi: json["deskripsi"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        gambar: json["gambar"],
        idAdmin: json["id_admin"],
        idUser: json["id_user"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        idKategori: json["id_kategori"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kategori_bencana": idKategoriBencana,
        "deskripsi": deskripsi,
        "longitude": longitude,
        "latitude": latitude,
        "gambar": gambar,
        "id_admin": idAdmin,
        "id_user": idUser,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "id_kategori": idKategori,
        "name": name,
        "icon": icon,
      };
}
