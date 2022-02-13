// To parse this JSON data, do
//
//     final simpleResponse = simpleResponseFromJson(jsonString);

import 'dart:convert';

SimpleResponse simpleResponseFromJson(String str) =>
    SimpleResponse.fromJson(json.decode(str));

String simpleResponseToJson(SimpleResponse data) => json.encode(data.toJson());

class SimpleResponse {
  SimpleResponse({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory SimpleResponse.fromJson(Map<String, dynamic> json) => SimpleResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
