import 'package:flutter/material.dart';
import 'package:note_app/Notes_page.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: NotesPage(),
    );
  }
}
