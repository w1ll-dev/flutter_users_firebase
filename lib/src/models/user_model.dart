import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String email;
  final String age;
  final String avatarUrl;

  User({
    @required this.name,
    @required this.email,
    @required this.age,
    @required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      age: json["age"],
      avatarUrl: json["avatarUrl"],
    );
  }
}
