import 'package:flutter/material.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/views/widget/user_tile.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final UserController userController = UserController();
  
  @override
  void initState() {
    super.initState();
    userController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: ListView.builder(
        itemCount: userController.usersList.length,
        itemBuilder: (c, index) => UserTile(
          user: userController.usersList[0],
        ),
      ),
    );
  }
}
