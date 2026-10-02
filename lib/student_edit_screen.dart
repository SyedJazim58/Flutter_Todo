import 'package:flutter/material.dart';

import 'package:todo_app/todo_app.dart';

class StudentEditScreen extends StatefulWidget {
  final Student studentId;
  const StudentEditScreen({super.key, required this.studentId});

  @override
  State<StudentEditScreen> createState() => _StudentEditScreenState();
}

class _StudentEditScreenState extends State<StudentEditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  void editStudent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;

    final newStudents = Student(id: widget.studentId.id, name: name, fatherName: fatherName);
    Navigator.pop(context, newStudents);  
  }



  

  @override
  void initState() {
    super.initState();
    nameController.text = widget.studentId.name;
    fatherNameController.text = widget.studentId.fatherName;
  }
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
              editStudent();
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
                  Icon(Icons.add, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Add Student',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
