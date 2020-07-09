import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_users_firebase/src/controllers/user_controller.dart';
import 'package:flutter_users_firebase/src/models/user_model.dart';
import 'package:flutter_users_firebase/src/views/users_list.dart';

class UserForm extends StatelessWidget {
  final User user;
  final String action;
  UserForm({this.user, this.usersController, this.action});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _avatarUrlController = TextEditingController();
  final UsersController usersController;

  @override
  Widget build(BuildContext context) {
    _nameController.text = user.name;
    _emailController.text = user.email;
    _ageController.text = user.age;
    _avatarUrlController.text = user.avatarUrl;
    final _emailKey = GlobalKey<FormState>();
    final _ageKey = GlobalKey<FormState>();
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
            Form(
              key: _emailKey,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (email) {
                  if (email == "") return "Email is empty.";
                  if (!email.contains("@")) return "Email requires '@'.";
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _ageKey,
              child: TextFormField(
                validator: (age) {
                  print(age);
                  if (int.parse(age) > 100) return "invalid age";
                  return null;
                },
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
            action == 'create'
                ? RaisedButton(
                    onPressed: () async => {
                      await usersController.create(
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
                    child: Text("Create"),
                    color: Colors.green[400],
                  )
                : RaisedButton(
                    onPressed: () async => {
                      if (_emailKey.currentState.validate() &&
                          _ageKey.currentState.validate())
                        {
                          await usersController.update(
                            id: user.id,
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
                    },
                    child: Text("Update", style: TextStyle(color: Colors.black54),),
                    color: Colors.yellow[400],
                  ),
          ],
        ),
      ),
    );
  }
}
