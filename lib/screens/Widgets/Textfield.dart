import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String lblText;
  final bool autoFocus, obscureText;
  final int maxLength;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const MyTextField({
    Key? key,
    required this.lblText, required this.autoFocus, required this.obscureText,
    required this.maxLength, required this.controller, required this.keyboardType,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextField(
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: textInputAction,
      autofocus: autoFocus,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: lblText,
        labelStyle: TextStyle(color: Color(0xFFF0f5e9c)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF0f5e9c)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF0f5e9c), width: 2),
        ),
      ),
    ));
  }
}
