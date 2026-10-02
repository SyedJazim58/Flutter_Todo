import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController componentcontroller;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.componentcontroller,
    required this.hintText,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: componentcontroller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}