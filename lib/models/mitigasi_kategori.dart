// To parse this JSON data, do
//
//     final Kategori = KategoriFromJson(jsonString);

import 'dart:convert';

MitigasiKategori mitigasiKategoriFromJson(String str) =>
    MitigasiKategori.fromJson(json.decode(str));

String MitigasiKategoriiToJson(MitigasiKategori data) =>
    json.encode(data.toJson());

class MitigasiKategori {
  MitigasiKategori({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<MitigasiKategoriData>? data;

  factory MitigasiKategori.fromJson(Map<String, dynamic> json) =>
      MitigasiKategori(
        success: json["success"],
        message: json["message"],
        data: List<MitigasiKategoriData>.from(
            json["data"].map((x) => MitigasiKategoriData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MitigasiKategoriData {
  MitigasiKategoriData(
      {this.id_kategori_bencana, this.name, this.icon, this.linkEmbed});

  dynamic id_kategori_bencana;
  String? name;
  String? icon;
  String? linkEmbed;

  factory MitigasiKategoriData.fromJson(Map<String, dynamic> json) =>
      MitigasiKategoriData(
          id_kategori_bencana: json["id_kategori_bencana"],
          name: json["name"],
          icon: json["icon"],
          linkEmbed: json["link_embed"]);

  Map<String, dynamic> toJson() => {
        "id_kategori_bencana": id_kategori_bencana,
        "name": name,
        "icon": icon,
        "link_embed": linkEmbed
      };
}
