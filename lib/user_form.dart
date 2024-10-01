import 'package:crud_app/field_form.dart';
import 'package:flutter/material.dart';

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
    return Center(
      child: Column(
        children: [
          FieldForm(
              label: 'Name', isPassword: false, controller: controllerName),
          FieldForm(
              label: 'Email', isPassword: false, controller: controllerEmail),
          FieldForm(
              label: 'Name', isPassword: true, controller: controllerPassword)
        ],
      ),
    );
  }
}
