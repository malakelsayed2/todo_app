import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  CustomListTile({super.key});

  bool isChecked = false;

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
            widget.isChecked = !widget.isChecked;
            setState(() {});
          },
          child: widget.isChecked
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
          "Read a book",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: widget.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          "Rest and Recharge you batteries your mind will thank you for it!",
          style: TextStyle(
            decoration: widget.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
