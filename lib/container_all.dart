import 'package:flutter/material.dart';

class ContainerAll extends StatelessWidget {
  Widget child;
  ContainerAll({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.lightBlue),
    );
  }
}
