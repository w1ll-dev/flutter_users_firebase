import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String age;
  final String avatarUrl;

  User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.age,
    @required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json, String id) {
    return User(
      name: json["name"],
      email: json["email"],
      age: json["age"],
      avatarUrl: json["avatarUrl"],
      id: id
    );
  }
}
