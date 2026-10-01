import 'package:flutter/material.dart';
import 'package:todo_app/for_students_add.dart';
import 'package:todo_app/student_edit_screen.dart';

class Student {
  String name;
  String fathername;
  List<String>? subjects;

  Student({required this.name, required this.fathername, this.subjects});
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StudentApp());
  }
}

class StudentApp extends StatefulWidget {
  const StudentApp({super.key});

  @override
  State<StudentApp> createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
  List<Student> students = [];

  // void showAddStudent(String name, String fatherName) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => ForStudentAdd()),
  //   );
  // }

  Future<void> showAddStudent() async {
    final student = await Navigator.push<Student>(
      context,
      MaterialPageRoute(builder: (context) => const ForStudentAdd()),
    );

    if (student != null) {
      setState(() {
        students.add(student);
      });
    }
  }

  void removeStudents(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  void editStudent(Student studenId) async {
    final result = await Navigation.push(
      context,
      MaterialPageRoute(builder: (context) => editStudent(studentId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student App')),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: students.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return StudentCard(student: students[index]);
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddStudent,

        // onPressed: () {
        //   showAddStudent(context);
        //   setState(() {
        //     students.add(student);
        //     //   // Student(name: 'Student $nextId', fathername: 'Father $nextId'),
        //     // );
        //     // nextId++;
        //   });
        // },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            student.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text("Father's name: ${student.fathername}"),
          IconButton(onPressed: removeStudents, icon: Icon(Icons.delete)),
          IconButton(onPressed: editStudents, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
