import 'package:flutter/material.dart';
import 'package:note_app/TextField.dart';


class EditNote extends StatelessWidget{

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
            const SizedBox(height: 50,),
            const TexttField(maxlines: 3, hinttext: 'Note'),
            const  SizedBox(height: 16,),
            const TexttField(maxlines: 1, hinttext: 'Date')
          ],
        ),
      ),
    );
  }
}