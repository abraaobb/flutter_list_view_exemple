import 'package:crud_app/field_form.dart';
import 'package:crud_app/user_provider.dart';
import 'package:crud_app/user.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class UserView extends StatelessWidget {
  UserView({super.key});

  String title = "Show user";

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
                onPressed: () {},
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
