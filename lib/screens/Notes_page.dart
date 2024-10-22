// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:note_app/Edit_Note.dart';
// import 'package:note_app/Notes_list.dart';
//
// class NotesPage extends StatefulWidget {
//
//   @override
//   State<NotesPage> createState() => _NotesPageState();
// }
//
// class _NotesPageState extends State<NotesPage> {
//   bool isloading =false;
//   Box? notesBox;
//
//   @override
//   void initState() {
//     super.initState();
//     notesBox = Hive.box('notesBox');
//   }
//
//   void _addNote(String note, String date) {
//     final newNote = {'note': note, 'date': date};
//     notesBox?.add(newNote);
//     setState(() {});
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notes'),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundImage: AssetImage('images/download (1).jpeg'),
//             ),
//           )
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(120.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: 350.0,
//                   height: 55.0,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.withOpacity(0.2),
//                       hintText: 'Search',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16,),
//               const Padding(
//                 padding: EdgeInsets.only(left: 8),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'All Notes',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16,),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         showModalBottomSheet(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             context: context, builder: (context)
//         {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const  SizedBox(height: 32,),
//                   TextField(
//                     maxLines: 1,
//                     decoration: InputDecoration(
//                       hintText: 'Note',
//                       helperStyle:const TextStyle(
//                         color: Color(0xffffcc80),
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           )
//                       ) ,
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           )
//                       ) ,
//                     ),
//                     onSubmitted: (value) {
//                       _addNote(
//                         value,
//                         DateTime.now().toString(),
//                       );
//                     },
//                   ),
//                   const  SizedBox(height: 16,),
//                   TextField(
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                       hintText: 'Date',
//                       helperStyle:const TextStyle(
//                         color: Color(0xffffcc80),
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           )
//                       ) ,
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           )
//                       ) ,
//                     ),
//                   ),
//                   const SizedBox(height: 32,),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 55,
//                     decoration: BoxDecoration(
//                         color:const Color(0xffffcc80),
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         'Add',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//       },
//         child: const Icon(
//           Icons.add,
//         ),
//       ),
//       body: NotesList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'Notes_list.dart';

class NotesPage extends StatefulWidget {
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  Box? notesBox;

  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    notesBox = Hive.box('notesBox');
  }

  // Function to add note to Hive
  void _addNote(String note, String date) {
    final newNote = {'note': note, 'date': date};
    notesBox?.add(newNote);
    setState(() {}); // refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show bottom sheet to add a new note
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 32),
                    TextField(
                      controller: _noteController,
                      decoration: const InputDecoration(hintText: 'Note'),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _dateController,
                      decoration: const InputDecoration(hintText: 'Date'),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        // Add the note when the button is pressed
                        if (_noteController.text.isNotEmpty &&
                            _dateController.text.isNotEmpty) {
                          _addNote(
                            _noteController.text,
                            _dateController.text,
                          );
                          Navigator.pop(context); // close the bottom sheet
                          _noteController.clear(); // clear the text field after adding
                          _dateController.clear();
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: NotesList(),
    );
  }
}
