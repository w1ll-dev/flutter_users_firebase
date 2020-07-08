import 'package:flutter_users_firebase/src/models/user_model.dart';
import 'package:flutter_users_firebase/src/repository/repository.dart';

import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UsersController = _UsersControllerBase with _$UsersController;

abstract class _UsersControllerBase with Store {
  @observable
  List<User> all = [];

  @observable
  int total = 0;

  @action
  getList() async {
    final response = await getUsers();
    all = [...response];
    total = all.length;
    print(all);
  }

  @action
  create({User user}) async {
    final status = await createUser(user: user);
    await getList();
    return status;
  }

  @action
  delete(String id) async {
    final status = await deleteUser(id: id);
    await getList();
    return status;
  }

  @action
  update({String id, User user}) async {
    final status = await updateUser(id: id, userUpdated: user);
    await getList();
    return status;
  }
}
