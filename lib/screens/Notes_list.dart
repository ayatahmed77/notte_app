import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/note_model.dart';
import 'edit_note.dart';

class NotesList extends StatelessWidget {
  final notesBox = Hive.box('notesBox');

  void deleteNote(int index) {
    notesBox.deleteAt(index);
  }

  void _openEditNoteView(BuildContext context, NoteModel note) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return EditNoteView();
      },
    );
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditNoteView();
              },));

              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
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
                    const SizedBox(height: 8),
                    Text(
                      note['content'] ?? 'No content',
                      style: const TextStyle(fontSize: 14.0, color: Colors.black54),
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.brown,
                        ),
                        onPressed: () {
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
