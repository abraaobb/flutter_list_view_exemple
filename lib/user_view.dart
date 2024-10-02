import 'package:crud_app/field_form.dart';
import 'package:crud_app/user_provider.dart';
import 'package:crud_app/user.dart';
import 'package:flutter/material.dart';

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
                label: 'Name',
                isPassword: false,
                controller: controllerName,
                isForm: false,
                isEmail: false),
            FieldForm(
                label: 'Email',
                isPassword: false,
                controller: controllerEmail,
                isForm: false,
                isEmail: false),
            FieldForm(
                label: 'Password',
                isPassword: false,
                controller: controllerPassword,
                isForm: false,
                isEmail: false),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/create');
                },
                child: Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  userProvider.indexUser = null;
                  userProvider.users.removeAt(index!);
                  Navigator.popAndPushNamed(context, '/create');
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
