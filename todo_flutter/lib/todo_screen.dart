import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoService _todoService = TodoService();
  final TextEditingController _newTask = TextEditingController();
  int _indexCurrent = 1;

  @override
  void dispose() {
    _newTask.dispose();
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width - 50,
          padding: const EdgeInsets.all(10),
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("New a task",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(controller: _newTask),
                TextButton(
                    onPressed: () {
                      _todoService.addTodo(_newTask.text, _indexCurrent);
                      setState(() {
                        _indexCurrent += 1;
                        _newTask.clear();
                      });
                    },
                    child: Text("ADD"))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        actions: [
          IconButton(
              onPressed: () {
                showModal(context);
              },
              icon: const Icon(CupertinoIcons.plus_circle_fill))
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: _todoService.list.length,
        itemBuilder: (context, index) {
          final todo = _todoService.list[index];
          return Container(
            child: ListTile(
              title: Text(todo.task),
              trailing: Container(
                child: Checkbox(
                    value: todo.finished,
                    onChanged: (value) {
                      _todoService.finishTaskSet(todo.id, value!);
                    }),
              ),
            ),
          );
        },
      )),
    );
  }
}
