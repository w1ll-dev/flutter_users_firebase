import 'package:flutter/material.dart';
import 'package:flutter_users_firebase/src/models/user_model.dart';

class UserTile extends StatelessWidget {
  final User user;
  UserTile({this.user});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
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
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
