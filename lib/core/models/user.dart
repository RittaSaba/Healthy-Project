import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class User {
  User({
    this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.profilePhoto,
    this.certificate,
    this.password_confirmation,
  });

  final String? name;
  final String email;
  final String phoneNumber;
  final Image? profilePhoto;
  final PlatformFile? certificate;
  final String password;
  final String? password_confirmation;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      profilePhoto: json["profile_photo"] ?? "",
      certificate: json["certificate"] ?? "",
      password: json["password"] ?? "",
      password_confirmation: json["password_confirmation"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "profile_photo": profilePhoto,
        "certificate": certificate,
        "password": password,
        "password_confirmation": password_confirmation
      };
}
