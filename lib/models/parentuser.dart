import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final ParentUser = ParentUserFromJson(jsonString);

ParentUser parentuserFromJson(String str) {
  final jsonData = json.decode(str);
  return ParentUser.fromJson(jsonData);
}

String parentuserToJson(ParentUser data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ParentUser {
  String parentId;
  String parentName;
  String childName;
  String parentemail;
  String parentphoneNumber;

  ParentUser({
    this.parentId,
    this.parentName,
    this.childName,
    this.parentemail,
    this.parentphoneNumber,
  });

  factory ParentUser.fromJson(Map<String, dynamic> json) => new ParentUser(
        parentId: json["parentId"],
        parentName: json["parentName"],
        childName: json["childName"],
        parentemail: json["parentemail"],
        parentphoneNumber: json["parentphoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "parentId": parentId,
        "parentName": parentName,
        "childName": childName,
        "parentemail": parentemail,
        "parentphoneNumber": parentphoneNumber,
      };

  factory ParentUser.fromDocument(DocumentSnapshot doc) {
    return ParentUser.fromJson(doc.data);
  }
}
