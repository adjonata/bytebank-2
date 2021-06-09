import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const Editor({Key key, this.label, this.controller, this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
      ),
      style: TextStyle(
        fontSize: 24,
      ),
      keyboardType: keyboardType,
      controller: controller,
    );
  }
}
