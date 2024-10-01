import 'package:crud_app/provider.dart';
import 'package:crud_app/user_form.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'CRUD APP',
        home: Scaffold(
          appBar: AppBar(
            title: Text('CRUD APP'),
          ),
          body: UserForm(),
        ),
        routes: {},
      ),
    );
  }
}
