// To parse this JSON data, do
//
//     final userApi = userApiFromJson(jsonString);

import 'dart:convert';

UserApi userApiFromJson(String str) => UserApi.fromJson(json.decode(str));

String userApiToJson(UserApi data) => json.encode(data.toJson());

class UserApi {
  UserApi({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory UserApi.fromJson(Map<String, dynamic> json) => UserApi(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.noTelp,
    this.gender,
    this.photo,
    this.isGoogle,
    this.isLogin,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? noTelp;
  String? gender;
  String? photo;
  dynamic isGoogle;
  dynamic isLogin;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        noTelp: json["no_telp"],
        gender: json["gender"],
        photo: json["photo"],
        isGoogle: json["is_google"],
        isLogin: json["is_login"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "no_telp": noTelp,
        "gender": gender,
        "photo": photo,
        "is_google": isGoogle,
        "is_login": isLogin,
        "role": role,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
