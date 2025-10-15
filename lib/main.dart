import 'package:authentication/sign_up_screen.dart';
import 'package:authentication/todo_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  //make sure that flutter engine is initialized
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize firebase
  await Firebase.initializeApp();  // await makes the app wait for future "firebase" to resolve
  runApp( ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirebaseAuth.instance.currentUser == null ? SignUpScreen() : TodoScreen(),);
  }
}
