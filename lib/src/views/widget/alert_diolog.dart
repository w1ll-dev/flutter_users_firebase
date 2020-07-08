import 'package:flutter/material.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/models/user_model.dart';

class AlertDelete extends StatelessWidget {
  final UsersController usersController;
  final User user;
  AlertDelete({this.user, this.usersController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete ${user.name}"),
      content: Text("Are you sure do you want delete ${user.name} ?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("no"),
        ),
        FlatButton(
          onPressed: () async => {
            await usersController.delete(user.id),
            Navigator.of(context).pop(),
          },
          child: Text("yes"),
        ),
      ],
    );
  }
}
