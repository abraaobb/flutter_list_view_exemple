import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool? isForm = true;

  FieldForm(
      {required this.label,
      required this.isPassword,
      required this.controller,
      this.isForm,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isForm,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          filled: true, fillColor: Colors.white, labelText: label),
    );
  }
}
