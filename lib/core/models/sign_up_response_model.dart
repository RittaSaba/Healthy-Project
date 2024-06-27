// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));



class SignUpModel {
  Data data;
  String message;

  SignUpModel({
    required this.data,
    required this.message,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );


}

class Data {
  String name;
  String email;
  String phoneNumber;
  String profilePhoto;
  String certificate;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.certificate,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"]??"",
    email: json["email"]??"",
    phoneNumber: json["phone_number"]??"",
    profilePhoto: json["profile_photo"]??"",
    certificate: json["certificate"]??"",
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );


}
