import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import 'package:flutter_users_firebase/src/views/user_form.dart';
import 'package:flutter_users_firebase/src/views/widget/user_tile.dart';

class UsersList extends StatelessWidget {
  final UsersController usersController = UsersController();

  void goToUserForm({BuildContext context}) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserForm(
            user: User(name: '', email: '', age: '', avatarUrl: ''),
            usersController: usersController,
            action: 'create',
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    usersController.getList();
    print("total ${usersController.total}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: usersController.total,
            itemBuilder: (context, index) {
              return UserTile(
                user: usersController.all[index],
                usersController: usersController,
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
        onPressed: () => goToUserForm(context: context),
      ),
    );
  }
}
