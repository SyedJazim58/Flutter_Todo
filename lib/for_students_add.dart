import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/custom_button.dart';
import 'package:todo_app/custom_text_field.dart';
import 'package:todo_app/todo_app.dart';

class ForStudentAdd extends StatefulWidget {
  const ForStudentAdd({super.key});

  @override
  State<ForStudentAdd> createState() => _ForStudentAddState();
}

class _ForStudentAddState extends State<ForStudentAdd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  void saveStuddent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;


    if (name.isNotEmpty || fatherName.isNotEmpty) {
      final newStudents = Student(id: Random().nextInt(1000), name: name, fatherName: fatherName);
      Navigator.pop(context, newStudents);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("not empty"),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
            CustomTextField(
            componentcontroller: nameController,
            hintText: 'Add Student',
          ),
            CustomTextField(
            componentcontroller: fatherNameController,
            hintText: 'Father Name',
          ),



          // TextField(
          //   controller: nameController,
          //   decoration: InputDecoration(labelText: 'Add Student'),
          // ),
          // TextField(
          //   controller: fatherNameController,
          //   decoration: InputDecoration(labelText: 'Father Name'),
          // ),

        CustomButton(buttonlable: "Add", onbuttonPressed: saveStuddent, buttonIcon: Icons.add)







          // InkWell(
          //   onTap: () {
          //     saveStuddent();
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(15),
          //     height: 150,
          //     width: 100,
          //     decoration: BoxDecoration(
          //       color: Colors.purple,
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     child: Row(
                
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(Icons.add, color: Colors.white),
          //         SizedBox(width: 8),
          //         Text(
          //           'Add Student',
          //           style: const TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// ## navigation keys

// push
// pop
