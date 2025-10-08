import 'package:authentication/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

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
        ],
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
