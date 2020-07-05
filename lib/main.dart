import 'package:flutter/material.dart';
import 'package:flutter_users_firebase/src/views/users_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Users',
      theme: ThemeData.dark(),
      home: UsersList(),
    );
  }
}
