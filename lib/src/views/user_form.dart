import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import 'package:flutter_users_firebase/src/views/users_list.dart';

class UserForm extends StatelessWidget {
  final User user;
  UserForm({this.user});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _avatarUrlController = TextEditingController();
  final UsersController _usersController = UsersController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form User"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _avatarUrlController,
              decoration: InputDecoration(
                labelText: "Avatar url",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () async => {
                await _usersController.create(
                  user: User(
                    name: _nameController.text,
                    email: _emailController.text,
                    age: _ageController.text,
                    avatarUrl: _avatarUrlController.text,
                  ),
                ),
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UsersList(),
                  ),
                ),
              },
              child: Text("Finalize"),
              color: Colors.green[400],
            ),
          ],
        ),
      ),
    );
  }
}
