import 'package:flutter/material.dart';

class EditNoteView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              children: [
                const Text(
                  'Edit Note',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(0.05),
                  ),
                  child:const Icon(
                    Icons.check,
                    size: 28,
                  ),
                )
              ],
            ),
            SizedBox(height: 50,),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Title',
                helperStyle:const TextStyle(
                  color: Color(0xffffcc80),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ) ,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ) ,

              ),
            ),
            const  SizedBox(height: 16,),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Content',
                helperStyle:const TextStyle(
                  color: Color(0xffffcc80),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ) ,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}