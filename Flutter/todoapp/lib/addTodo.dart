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
        const Text('Add Todo'),
        TextField(
          onSubmitted: (value) => widget.addTodo(todoText: todoText.text),
          autofocus: true,
          controller: todoText,
          decoration: const InputDecoration(
            hintText: 'Enter your todo',
            contentPadding: EdgeInsets.all(5),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            //check if textbox is not empty if it is return alert dialog
            if (todoText.text.isEmpty) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Please enter a todo'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
              return;
            }
            widget.addTodo(todoText: todoText.text);
            todoText.clear();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
