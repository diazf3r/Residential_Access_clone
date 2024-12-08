// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput(
      {super.key,
      required this.controlador,
      required this.dialogo,
      this.maxLength,
      this.maxLines = 1});

  final TextEditingController controlador;
  final String dialogo;
  int maxLines;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Text(
          dialogo,
          style: TextStyle(color: Colors.blueGrey[500]),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(25, 25)),
        ),
      ),
    );
  }
}
