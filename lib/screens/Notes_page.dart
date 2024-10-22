import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'Notes_list.dart';

class NotesPage extends StatefulWidget {
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  Box? notesBox;
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    notesBox = Hive.box('notesBox');
  }

  // Function to add note to Hive
  void _addNote(String note, String content) {
      var currentDate = DateTime.now();
      var formattedDate = DateFormat('dd MMMM yyyy, hh:mm a').format(currentDate);

      final newNote = {
        'note': note,
        'content': content,
        'date': formattedDate
      };
      notesBox?.add(newNote);
      setState(() {});

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note added successfully!')),
      );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                      controller: _contentController,
                      decoration: const InputDecoration(hintText: 'Content'),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_noteController.text.isNotEmpty &&
                            _contentController.text.isNotEmpty) {
                          _addNote(
                            _noteController.text,
                            _contentController.text,
                          );
                          Navigator.pop(context);
                          _noteController.clear();
                          _contentController.clear();
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

