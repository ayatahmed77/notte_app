import 'package:flutter/material.dart';

class TexttField extends StatelessWidget {
  final int maxlines;
  final String hinttext;

  const TexttField({super.key, required this.maxlines, required this.hinttext,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hinttext,
        helperStyle: const TextStyle(
          color: Color(0xffffcc80),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}