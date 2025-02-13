import 'package:crud_app/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  List<User> users = [];
  User? userSelected;
  int? indexUser;
  UserProvider({required this.child, super.key}) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  bool updateShouldNotify(UserProvider widget) {
    return true;
  }
}
