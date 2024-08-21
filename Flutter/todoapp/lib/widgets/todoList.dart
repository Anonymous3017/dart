import 'package:flutter/material.dart';

class TodoListBuilder extends StatefulWidget {
  List<String> todoList = [];
  void Function() updateLocalData;
  TodoListBuilder(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  //function to show modal bottom sheet
  void onItemClicked({required index}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.todoList.removeAt(index);
                    });
                    widget.updateLocalData();
                    Navigator.pop(context);
                  },
                  child: const Text('Mark as done')));
        });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? const Center(
            child: Text("No Items in Todo List",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decorationColor: Colors.black,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: 0.5)))
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (context, int index) {
              return Dismissible(
                key: UniqueKey(),
                //direction of swipe restrected to left to right only
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.green,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Add a text of done to the left of the icon
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Done'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.done),
                      ),
                    ],
                  ),
                ),
                // restricted this secondary background above to show only on left to right swipe
                secondaryBackground: Container(
                  color: Colors.red,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                },
                child: ListTile(
                  title: Text(widget.todoList[index]),
                  //make list fontwidth bold
                  titleTextStyle: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      decorationColor: Colors.black,
                      decorationStyle: TextDecorationStyle.solid,
                      letterSpacing: 0.5),
                  tileColor: Colors.grey[200],

                  onTap: () {
                    onItemClicked(index: index);
                  },
                ),
              );
            });
  }
}
