import 'dart:convert';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import "package:http/http.dart" as http;

const _baseUrl = "https://test-flutter-users.firebaseio.com";

Future<List<User>> getUsers() async {
  final response = await http.get("$_baseUrl/user.json");
  Map<String, dynamic> jsonRes = jsonDecode(response.body);

  List<User> list = [];

  jsonRes.forEach((key, value) {
    list.add(User.fromJson(value));
  });

  return response.statusCode == 200 ? list : Exception("Fail");
}

Future<void> createUser(User user) async {
  await http.post(
    "$_baseUrl/user.json",
    body: jsonEncode({
      'name': user.name,
      'email': user.email,
      'age': user.age,
      'avatarUrl': user.avatarUrl,
    }),
  );
}
