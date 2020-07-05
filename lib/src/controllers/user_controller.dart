import 'dart:convert';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import "package:http/http.dart" as http;

class UserController {
  static const _baseUrl = "https://test-flutter-users.firebaseio.com/user.json";
  List<User> usersList = []; 
  
  Future<List<User>> getUsers() async {
    final response = await http.get("$_baseUrl");
    Map<String, dynamic> jsonRes = jsonDecode(response.body);

    jsonRes.forEach((key, value) {
      usersList.add(User.fromJson(value));
    });
    
    return response.statusCode == 200 ? usersList : Exception("Fail");
  }

  Future<void> createUser(User user) async {
    await http.post(
      "$_baseUrl",
      body: jsonEncode({
        'name': user.name,
        'email': user.email,
        'age': user.age,
        'avatarUrl': user.avatarUrl,
      }),
    );
  }
}
