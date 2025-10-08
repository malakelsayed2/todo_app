import 'package:authentication/sign_up_screen.dart';
import 'package:authentication/login_screen.dart';
import 'package:authentication/todo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoScreen(),);
  }
}
