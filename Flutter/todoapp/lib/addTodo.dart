import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;

  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Add Todo'),
        TextField(
          controller: todoText,
          decoration: InputDecoration(
            hintText: 'Enter your todo',
            contentPadding: EdgeInsets.all(5),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print(todoText.text);
            widget.addTodo(todoText: todoText.text);
            todoText.clear();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
