import 'package:flutter/material.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import 'package:flutter_users_firebase/src/views/user_form.dart';
import 'package:flutter_users_firebase/src/views/widget/alert_diolog.dart';

class UserTile extends StatelessWidget {
  final User user;
  final UsersController usersController;
  UserTile({this.user, this.usersController});

  void goToUserForm({BuildContext context, User user}) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserForm(
            user: user,
            usersController: usersController,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl) ?? Icon(Icons.person),
      ),
      title: Text("${user.name}"),
      subtitle: Text("${user.email}"),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.yellow,
              ),
              onPressed: () => goToUserForm(context: context, user: user),
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDelete(
                  user: user,
                  usersController: usersController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
