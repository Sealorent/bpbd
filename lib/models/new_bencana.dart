// To parse this JSON data, do
//
//     final newBencana = newBencanaFromJson(jsonString);

import 'dart:convert';

NewBencana newBencanaFromJson(String str) =>
    NewBencana.fromJson(json.decode(str));

String newBencanaToJson(NewBencana data) => json.encode(data.toJson());

class NewBencana {
  NewBencana({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<NewBencanaData>? data;

  factory NewBencana.fromJson(Map<String, dynamic> json) => NewBencana(
        success: json["success"],
        message: json["message"],
        data: List<NewBencanaData>.from(
            json["data"].map((x) => NewBencanaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NewBencanaData {
  NewBencanaData({
    this.id,
    this.title,
    this.idKategoriBencana,
    this.deskripsi,
    this.longitude,
    this.latitude,
    this.gambar,
    this.idAdmin,
    this.idUser,
    this.status,
    this.desaId,
    this.kecamatanId,
    this.createdAt,
    this.idKategori,
    this.name,
    this.icon,
    this.linkEmbed,
    this.photos,
    this.namaKecamatan,
    this.namaDesa,
  });

  dynamic? id;
  String? title;
  dynamic? idKategoriBencana;
  String? deskripsi;
  String? longitude;
  String? latitude;
  String? gambar;
  dynamic? idAdmin;
  dynamic? idUser;
  String? status;
  dynamic? desaId;
  dynamic? kecamatanId;
  String? createdAt;
  dynamic? idKategori;
  String? name;
  String? icon;
  String? linkEmbed;
  String? photos;
  String? namaKecamatan;
  String? namaDesa;

  factory NewBencanaData.fromJson(Map<String, dynamic> json) => NewBencanaData(
        id: json["id"],
        title: json["title"],
        idKategoriBencana: json["id_kategori_bencana"],
        deskripsi: json["deskripsi"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        gambar: json["gambar"],
        idAdmin: json["id_admin"],
        idUser: json["id_user"],
        status: json["status"],
        desaId: json["desa_id"],
        kecamatanId: json["kecamatan_id"],
        createdAt: json["created_at"].toString().substring(0, 10),
        idKategori: json["id_kategori"],
        name: json["name"],
        icon: json["icon"],
        linkEmbed: json["link_embed"],
        photos: json["photos"],
        namaKecamatan: json["nama_kecamatan"],
        namaDesa: json["nama_desa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "id_kategori_bencana": idKategoriBencana,
        "deskripsi": deskripsi,
        "longitude": longitude,
        "latitude": latitude,
        "gambar": gambar,
        "id_admin": idAdmin,
        "id_user": idUser,
        "status": status,
        "desa_id": desaId,
        "kecamatan_id": kecamatanId,
        "created_at": createdAt,
        "id_kategori": idKategori,
        "name": name,
        "icon": icon,
        "link_embed": linkEmbed,
        "photos": photos,
        "nama_kecamatan": namaKecamatan,
        "nama_desa": namaDesa,
      };
}
