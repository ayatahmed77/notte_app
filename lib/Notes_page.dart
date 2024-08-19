import 'package:flutter/material.dart';
import 'package:note_app/Notes_list.dart';
import 'package:note_app/TextField.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          actions: const [
              Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/download (1).jpeg'),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize:const Size.fromHeight(120.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Container(
                    width: 350.0,
                    height: 55.0,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'All Notes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ),
                const SizedBox(height: 16,),
                  ],
                ),
            ),
          ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
                  context: context, builder: (context)
          {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const  SizedBox(height: 32,),
                    const TexttField(maxlines: 3, hinttext: 'Note'),
                    const  SizedBox(height: 16,),
                    const TexttField(maxlines: 1, hinttext: 'date'),
                    const SizedBox(height: 32,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      decoration: BoxDecoration(
                          color:const Color(0xffffcc80),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,)
                  ],
                ),
            );
          });
        },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: NotesList(),
    );
  }
}
