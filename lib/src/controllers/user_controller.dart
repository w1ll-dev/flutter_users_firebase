import 'dart:convert';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import "package:http/http.dart" as http;

import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UsersController = _UsersControllerBase with _$UsersController;

abstract class _UsersControllerBase with Store {
  static const _baseUrl = "https://test-flutter-users.firebaseio.com/user.json";
  
  @observable
  List<User> usersList = [];

  @action
  Future<void> getUsers() async {
    final response = await http.get("$_baseUrl");
    Map<String, dynamic> jsonRes = jsonDecode(response.body);

    jsonRes.forEach((key, value) {
      usersList.add(User.fromJson(value));
    });
    print("List: ${usersList[0].name}");
  }

  // @action
  // Future<void> createUser(User user) async {
  //   await http.post(
  //     "$_baseUrl",
  //     body: jsonEncode({
  //       'name': user.name,
  //       'email': user.email,
  //       'age': user.age,
  //       'avatarUrl': user.avatarUrl,
  //     }),
  //   );
  // }
}
