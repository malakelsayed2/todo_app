import 'package:authentication/widgets/custom_button.dart';
import 'package:authentication/widgets/custom_list_tile.dart';
import 'package:authentication/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text("Todo Screen", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(Icons.delete, size: 30, color: Colors.white),
          ),
          IconButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              } catch (e) {
                print("Error: ${e.toString()}");
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("error")));
              }
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              final titleController = TextEditingController();
              final descriptionController = TextEditingController();
              return Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      icon: Icons.check_circle_outline,
                      validator: (String? String) {},
                      controller: titleController,
                      hintText: 'Task Title',
                    ),
                    SizedBox(height: 20,),
                    CustomTextField(
                      icon: Icons.check_circle_outline,
                      validator: (String? String) {},
                      controller: descriptionController,
                      hintText: 'Task description',
                    ),
                    SizedBox(height: 20,),
                    CustomButton(label: "Add Task", onPressed: () {}),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.purple.shade700,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemBuilder: (context, index) => CustomListTile(),
          separatorBuilder: (context, index) => Container(height: 20),
          itemCount: 4,
        ),
      ),
    );
  }
}
