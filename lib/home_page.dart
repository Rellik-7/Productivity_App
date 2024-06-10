import 'package:flutter/material.dart';
import 'package:productivity_app/utils/todolist_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List TodoList = [
    ['Learn Flutter', false],
    ['Learn Driving', false],
  ];

  final _controller = TextEditingController();

  void changeTaskStatus(int index) {
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  void addNewTask() {
    setState(() {
      TodoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      TodoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('To Do\'s')),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.deepPurple.shade300,
      body: ListView.builder(
        itemCount: TodoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodolistTile(
              taskName: TodoList[index][0],
              taskStatus: TodoList[index][1],
              onChanged: (value) => changeTaskStatus(index),
              deleteTask: (context) => deleteTask(index));
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a new task',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                addNewTask();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
