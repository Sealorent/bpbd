// To parse this JSON data, do
//
//     final mitigasi = mitigasiFromJson(jsonString);

import 'dart:convert';

Mitigasi mitigasiFromJson(String str) => Mitigasi.fromJson(json.decode(str));

String mitigasiToJson(Mitigasi data) => json.encode(data.toJson());

class Mitigasi {
  Mitigasi({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<MitigasiData>? data;

  factory Mitigasi.fromJson(Map<String, dynamic> json) => Mitigasi(
        success: json["success"],
        message: json["message"],
        data: List<MitigasiData>.from(
            json["data"].map((x) => MitigasiData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MitigasiData {
  MitigasiData({
    this.id,
    this.name,
    this.icon,
  });

  int? id;
  String? name;
  String? icon;

  factory MitigasiData.fromJson(Map<String, dynamic> json) => MitigasiData(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}
