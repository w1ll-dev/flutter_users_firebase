import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/views/widget/user_tile.dart';

class UsersList extends StatelessWidget {
  final UsersController usersController = UsersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: Observer(
        builder: (_) {
          return FutureBuilder(
            future: usersController.getUsers(),
            builder: (c, snapshot) => ListView.builder(
              itemCount: usersController.usersList.length,
              itemBuilder: (c, index) {
                print("Will: ${usersController.usersList[0].name}");
                return UserTile(
                  user: usersController.usersList[0],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
