import 'package:authentication/models/task_model.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
 CustomListTile({super.key, required this.model});

  TaskModel model ;


  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.model.isCompleted = !widget.model.isCompleted;
            setState(() {});
          },
          child: widget.model.isCompleted
              ? Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey, width: 2),
                    color: Colors.purple.shade700,
                  ),
                  child: Icon(Icons.check, color: Colors.white),
                )
              : Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                ),
        ),
        title: Text(
          widget.model.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: widget.model.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          widget.model.description,
          style: TextStyle(
            decoration: widget.model.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
