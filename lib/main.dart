import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD APP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('CRUD APP'),
        ),
        body: Text('body'),
      ),
      routes: {},
    );
  }
}
