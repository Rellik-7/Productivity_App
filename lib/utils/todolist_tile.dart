import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodolistTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final Function(bool?)?
      onChanged; // Function to alter the state of the checkbox
  final Function(BuildContext)? deleteTask; // Function to delete a task

  const TodolistTile(
      {super.key,
      required this.taskName,
      required this.taskStatus,
      required this.onChanged,
      this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade400,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          children: [
            Checkbox(
              value: taskStatus,
              onChanged: onChanged,
              side: const BorderSide(color: Colors.white),
              activeColor: Colors.white,
              checkColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  decoration: taskStatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2),
            ),
          ],
        ),
      ),
    );
  }
}
