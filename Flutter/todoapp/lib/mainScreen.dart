import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/addTodo.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    setState(() {
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context);
  }

  void updateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  
    // Save a list of strings to 'todoList' key.
    await prefs.setStringList('todoList', todoList);
  }
  
  void loadData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  
    // Try reading data from the 'todoList' key. If it doesn't exist, return an empty list.
    setState(() {
      todoList = (prefs.getStringList('todoList') ?? []).toList();
    });
  }
  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Todo App'),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
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
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(todoList[index]),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    todoList.removeAt(index);
                                  });
                                  updateLocalData();
                                  Navigator.pop(context);
                                },
                                child: Text('Mark as done')));
                      });
                },
              );
            }));
  }
}
