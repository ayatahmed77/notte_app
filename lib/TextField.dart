import 'package:flutter/material.dart';

class TexttField extends StatelessWidget {
  final int maxlines;
  final String hinttext;

  const TexttField({super.key, required this.maxlines, required this.hinttext, this.onSaved,});

   final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onSaved: onSaved,
      validator: (value){
        if (value?.isEmpty  ?? true){return 'field is required ';}
        else{return null;}
      },

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