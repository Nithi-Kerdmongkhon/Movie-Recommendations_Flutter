import 'package:flutter/material.dart';

import 'input_with_error_text.dart';

// ignore: must_be_immutable
class MyTextInputWithErrorText extends StatelessWidget {
  InputWithErrorText input;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Icon icon;

  MyTextInputWithErrorText(
      {super.key,
      required this.input,
      required this.hintText,
      required this.keyboardType,
      this.obscureText = false,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: TextField(
        onChanged: (value) {
          input.valueText = value;
        },
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorText: input.errorText,
          hintText: hintText,
          suffixIcon: icon,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(235, 255, 255, 255)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontFamily: 'Instpiration'),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
