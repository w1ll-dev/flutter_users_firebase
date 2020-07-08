import 'dart:convert';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import "package:http/http.dart" as http;

const _baseUrl = "https://test-flutter-users.firebaseio.com";

Future<List<User>> getUsers() async {
  final response = await http.get("$_baseUrl/user.json");
  Map<String, dynamic> jsonRes = jsonDecode(response.body);

  List<User> list = [];

  jsonRes.forEach((key, value) {
    list.add(User.fromJson(value, key));
  });

  return response.statusCode == 200 ? list : Exception("Fail");
}

Future<void> createUser({User user}) async {
  http
      .post("$_baseUrl/user.json",
          body: jsonEncode({
            'name': user.name,
            'email': user.email,
            'age': user.age,
            'avatarUrl': user.avatarUrl,
          }))
      .then((value) => value.statusCode);
}

Future<void> deleteUser({String id}) async {
  http
      .delete(
        "$_baseUrl/user/$id.json",
      )
      .then((value) => value.statusCode);
}

Future<void> updateUser({String id, User userUpdated}) async {
  http
      .patch("$_baseUrl/user/$id.json",
          body: jsonEncode({
            'name': userUpdated.name,
            'email': userUpdated.email,
            'age': userUpdated.age,
            'avatarUrl': userUpdated.avatarUrl,
          }))
      .then((value) => value.statusCode);
}
