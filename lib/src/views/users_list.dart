import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/views/user_form.dart';
import 'package:flutter_users_firebase/src/views/widget/user_tile.dart';

class UsersList extends StatelessWidget {
  final UsersController usersController = UsersController();

  void goToUserForm(context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserForm(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    usersController.getList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: usersController.all.length,
            itemBuilder: (c, index) {
              return UserTile(
                user: usersController.all[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[400],
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        onPressed: () => goToUserForm(context),
      ),
    );
  }
}
