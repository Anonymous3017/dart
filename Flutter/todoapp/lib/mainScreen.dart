import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/addTodo.dart';
import 'package:todoapp/widgets/appDrawer.dart';
import 'package:todoapp/widgets/todoList.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<String> todoList = [];

  //function to add todos to the list
  void addTodo({required String todoText}) {
    // check if todo already exists in the list if it does show alert dialog
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Todo already exists'),
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

    //add todo to the list and update the state
    setState(() {
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context);
  }

  //function to update local data and save it to shared preferences
  void updateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save a list of strings to 'todoList' key.
    await prefs.setStringList('todoList', todoList);
  }

  //function to load data from shared preferences
  void loadData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Try reading data from the 'todoList' key. If it doesn't exist, return an empty list.
    setState(() {
      todoList = (prefs.getStringList('todoList') ?? []).toList();
    });
  }

  //function to show modal bottom sheet to add todo
  void showAddTodoBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 200,
              child: AddTodo(addTodo: addTodo),
            ),
          );
        });
  }

  //load data when the screen is loaded for the first time
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showAddTodoBottomSheet,
          backgroundColor: Colors.blueGrey[900],
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('Todo App'),
          centerTitle: true,
        ),
        body: TodoListBuilder(
            todoList: todoList, updateLocalData: updateLocalData));
  }
}
