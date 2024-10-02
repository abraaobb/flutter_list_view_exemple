import 'package:crud_app/field_form.dart';
import 'package:crud_app/provider.dart';
import 'package:crud_app/user.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create user'),
        actions: [
          Container(
            child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/list');
                },
                child: Text('User list')),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            FieldForm(
                label: 'Name', isPassword: false, controller: controllerName),
            FieldForm(
                label: 'Email', isPassword: false, controller: controllerEmail),
            FieldForm(
                label: 'Password',
                isPassword: true,
                controller: controllerPassword),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  UserProvider userProvider =
                      UserProvider.of(context) as UserProvider;

                  User user = User(
                      name: controllerName.text,
                      email: controllerEmail.text,
                      password: controllerPassword.text);

                  int usersLength = userProvider.users.length;

                  userProvider.users.insert(usersLength, user);

                  dev.log('entrei $userProvider');

                  Navigator.popAndPushNamed(context, '/list');
                },
                child: Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.deepPurple)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
