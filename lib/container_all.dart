import 'package:flutter/material.dart';

class ContainerAll extends StatelessWidget {
  Widget child;
  ContainerAll({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Colors.lightBlue),
    );
  }
}
