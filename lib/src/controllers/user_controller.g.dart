// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersController on _UsersControllerBase, Store {
  final _$allAtom = Atom(name: '_UsersControllerBase.all');

  @override
  List<User> get all {
    _$allAtom.reportRead();
    return super.all;
  }

  @override
  set all(List<User> value) {
    _$allAtom.reportWrite(value, super.all, () {
      super.all = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('_UsersControllerBase.getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$createAsyncAction = AsyncAction('_UsersControllerBase.create');

  @override
  Future create({User user}) {
    return _$createAsyncAction.run(() => super.create(user: user));
  }

  final _$deleteAsyncAction = AsyncAction('_UsersControllerBase.delete');

  @override
  Future delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
all: ${all}
    ''';
  }
}
