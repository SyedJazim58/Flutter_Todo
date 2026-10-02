import 'package:flutter/material.dart';
import 'package:todo_app/for_students_add.dart';
import 'package:todo_app/student_edit_screen.dart';

class Student {
  int id;
  String name;
  String fatherName;
  List<String>? subjects;

  Student({required this.id, required this.name, required this.fatherName, this.subjects});
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
    final newStudent = await Navigator.push<Student>(
      context,
      MaterialPageRoute(builder: (context) => const ForStudentAdd()),
    );

    if (newStudent != null && newStudent is Student) {
      setState(() {
        students.add(newStudent);
      });
    }
  }

  void removeStudents(Student studentId) {
    setState(() {
      students.remove(studentId);
    });
  }

  void editStudent(Student studentId) async {
    final result = await Navigator.push<Student>(
      context,
      MaterialPageRoute(
        builder: (context) => StudentEditScreen(studentId: studentId),
      ),
    );


    int foundIndex = students.indexWhere(
      (student) => student.id == result.id);
    students[foundIndex] = result;

    setState(() {});
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
          return StudentCard(
            student: students[index],
            onDelete: removeStudents,
            onEdit: editStudent,
          );
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
  final Function(Student) onDelete;
  final Function(Student) onEdit;

  const StudentCard({
    super.key,
    required this.student,
    required this.onDelete,
    required this.onEdit,
  });

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 20,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text("Father's name: ${student.fatherName}"),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              IconButton(
                onPressed: () {
                  onDelete(student);
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {
                  onEdit(student);
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
