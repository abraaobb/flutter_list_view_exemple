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
    save() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;

      User user = User(
          name: controllerName.text,
          email: controllerEmail.text,
          password: controllerPassword.text);

      userProvider.users.insert(0, user);
      dev.log(userProvider.users[0].name);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create user'),
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
                onPressed: save(),
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
