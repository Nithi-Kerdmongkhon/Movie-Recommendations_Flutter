import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const MyTextInput({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
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
