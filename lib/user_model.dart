import 'package:flutter/material.dart';

class UserModel {
  final String profileImage;
  final String userName;
  final bool Isverified;
  final String companyName;
  final String Isactive;

  UserModel(
      {required this.profileImage,
      required this.userName,
      required this.companyName,
      required this.Isverified,
      required this.Isactive});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print(" \n\nname : ${json["name"]}");
    return UserModel(
        companyName: json['company'],
        profileImage: json['companyImageURL'],
        userName: json['name'],
        Isverified: json['verified'],
        Isactive: json['status']);
  }
}
