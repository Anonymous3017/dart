import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/addTodo.dart';
import 'package:todoapp/widgets/todoList.dart';
import 'package:url_launcher/url_launcher.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<String> todoList = [];

  //function to add todos to the list
  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Todo already exists'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

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
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.blueGrey[900],
          shape: CircleBorder(),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                height: 200,
                width: double.infinity,
                child: const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  launchUrl(Uri.https('f8th.netlify.app', ''));
                },
                leading: Icon(Icons.person),
                title: const Text('About Me',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                onTap: () {
                  launchUrl(Uri.https('mailto:ayushgupta9592@gmail.com', ''));
                },
                leading: Icon(Icons.email),
                title: const Text('Contact Me',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Todo App'),
          centerTitle: true,
        ),
        body: TodoListBuilder(
            todoList: todoList, updateLocalData: updateLocalData));
  }
}
