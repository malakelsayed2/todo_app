import 'package:authentication/widgets/custom_button.dart';
import 'package:authentication/widgets/custom_list_tile.dart';
import 'package:authentication/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'models/task_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TaskModel> tasks = [];

  void fetchTasks() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("tasks")
        .orderBy("createdAt" , descending : false)
        .get();

    final models = snapshot.docs.map((e) {
      final data = e.data();
      return TaskModel(title: e['title'],
          description: e['description'],
          isCompleted: e['isCompleted'],
          id: e['id']);
    },).toList();

    setState(() {

    });

    tasks = models ;
  }

  @override
  void initState() {
    // TODO: implement initState
    print(tasks) ;
    fetchTasks() ;
    print(tasks);
    super.initState();
  }

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
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
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
                    SizedBox(height: 20),
                    CustomTextField(
                      icon: Icons.check_circle_outline,
                      validator: (String? String) {},
                      controller: descriptionController,
                      hintText: 'Task description',
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      label: "Add Task",
                      onPressed: () async {
                        final task = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false,
                          id: UniqueKey().toString(),
                        );
                        tasks.add(task);

                        //add task in firestore

                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection("tasks")
                            .doc(task.id)
                            .set({
                          "id": task.id,
                          "title": task.title,
                          "description": task.description,
                          "isCompleted": task.isCompleted,
                          "createdAt": FieldValue.serverTimestamp()
                        });
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.purple.shade700,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: tasks.isEmpty
          ? Center(
        child: Text(
          "Add your first Task!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Hello, ${FirebaseAuth.instance.currentUser?.displayName ?? "user"} 👋" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index){
                     final model = tasks[index] ;
                    return CustomListTile(
                      model: tasks[index],
                      onRemove: ()async{
                        tasks.removeAt(index);
                        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("tasks").doc(model.id).delete();
                        setState(() {});
                      },
                    );},
                separatorBuilder: (context, index) => Container(height: 20),
                itemCount: tasks.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
