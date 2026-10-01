import 'package:flutter/material.dart';

class ForStudentAdd extends StatefulWidget {
  const ForStudentAdd({super.key});

  @override
  State<ForStudentAdd> createState() => _ForStudentAddState();
}

class Student {
  final String name;
  final String fatherName;

  const Student({required this.name, required this.fatherName});
}

class _ForStudentAddState extends State<ForStudentAdd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  void saveStuddent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;

    final newStudents = Student(name: name, fatherName: fatherName);
    Navigator.pop(context, newStudents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Add Student'),
          ),
          TextField(
            controller: fatherNameController,
            decoration: InputDecoration(labelText: 'Father Name'),
          ),

          InkWell(
            onTap: () {
              saveStuddent();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white,),
                  SizedBox(width: 8),
                  Text('Add Student', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ## navigation keys

// push
// pop
