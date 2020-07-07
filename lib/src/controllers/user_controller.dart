import 'package:flutter_users_firebase/src/models/user_model.dart';
import 'package:flutter_users_firebase/src/repository/repository.dart';

import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UsersController = _UsersControllerBase with _$UsersController;

abstract class _UsersControllerBase with Store {
  @observable
  List<User> all = [];

  @action
  getList() async {
    final response = await getUsers();
    all = [...response];
  }
  

  @action
  int count() => all.length;

}
