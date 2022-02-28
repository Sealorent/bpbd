// To parse this JSON data, do
//
//     final download = downloadFromJson(jsonString);

import 'dart:convert';

Download downloadFromJson(String str) => Download.fromJson(json.decode(str));

String downloadToJson(Download data) => json.encode(data.toJson());

class Download {
  Download({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<DataDownload>? data;

  factory Download.fromJson(Map<String, dynamic> json) => Download(
        success: json["success"],
        message: json["message"],
        data: List<DataDownload>.from(
            json["data"].map((x) => DataDownload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataDownload {
  DataDownload({
    this.id,
    this.title,
    this.pdf,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? pdf;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DataDownload.fromJson(Map<String, dynamic> json) => DataDownload(
        id: json["id"],
        title: json["title"],
        pdf: json["pdf"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "pdf": pdf,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
