// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:note_app/Edit_Note.dart';
//
// class NotesList extends StatelessWidget {
//   final notesBox = Hive.box('notesBox');
//
//   @override
//   Widget build(BuildContext context) {
//
//     final notes = [{
//         'color': Colors.yellow,
//         'note': 'Reminder to create a design brief for the project tomorrow',
//         'date': 'Aug 24, 2020',
//         'image': 'images/download.jpeg',
//       },
//       {
//         'color': Colors.white,
//         'note': 'Get the development team involved in an early stage',
//         'date': 'Aug 24, 2020',
//         'image': 'images/images.jpeg',
//       },
//       {
//         'color': Colors.grey,
//         'note': 'Think about what parts of the narrative we want to share...',
//         'date': 'Aug 23, 2020',
//         'image': 'images/images.jpeg',
//       },
//       {
//         'color': Colors.grey,
//         'note': 'Consider how much information can be digested',
//         'date': 'Aug 23, 2020',
//         'image': 'images/images (1).jpeg',
//       },
//       {
//         'color': Colors.white,
//         'note': 'Get the development team involved in an early stage',
//         'date': 'Nov 6, 2019',
//         'image': 'images/download (1).jpeg',
//       },
//       {
//         'color': Colors.yellow,
//         'note': 'Reminder to create a design brief for the project tomorrow',
//         'date': 'Jun 3, 2018',
//         'image':'images/images.jpeg',
//       },
//     ];
//
//     return ValueListenableBuilder(
//         valueListenable: notesBox.listenable(),
//         builder: (context, Box box, _) {
//            if (box.isEmpty) {
//                return const Center(
//                      child: Text('No Notes yet!'),
//                  );
//                 }
//     return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//           ),
//           itemCount: notes.length,
//           itemBuilder: (context, index) {
//             final note = notes[index];
//             return GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return EditNote();
//                   }));
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: note['color'] as Color,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 10,),
//                       Text(
//                         note['note'] as String,
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 12,),
//                       Text(
//                         note['date'] as String,
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: Colors.black.withOpacity(0.8),
//                         ),
//                       ),
//                       const SizedBox(height: 12,),
//                       Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CircleAvatar(
//                           radius: 12.0,
//                           backgroundImage: AssetImage(note['image'] as String),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//             );
//           },
//          ),
//        );
//      }
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class NotesList extends StatelessWidget {
  final notesBox = Hive.box('notesBox');

  // Function to delete a note by its index
  void deleteNote(int index) {
    notesBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notesBox.listenable(),
      builder: (context, Box box, _) {
        if (box.isEmpty) {
          return const Center(
            child: Text('No Notes yet!'),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: box.length,
          itemBuilder: (context, index) {
            final note = box.getAt(index);
            return GestureDetector(
              onTap: () {
                // You can add code here to edit the note if needed
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.yellow, // Adjust colors as needed
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      note['note'],
                      style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      note['date'],
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Delete Button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Delete the note at the current index
                          deleteNote(index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

