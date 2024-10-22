import 'package:flutter/material.dart';
import 'package:mytodo/Model/todo.dart';
import 'todoitem.dart';
class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _controller=TextEditingController();
  todoPriority priority = todoPriority.Medium;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: const Text('My Todos'),
      backgroundColor: Colors.tealAccent,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: (){
          addTodo();
        },
        backgroundColor: Colors.tealAccent,
       // borderRadius: BorderRadius.circular(16),
        child: const Icon(Icons.add),
        ),
        
      body:MyTodo.todos.isEmpty ? const Center(child: Text('No Todos')) :
       ListView.builder(
        itemCount:MyTodo.todos.length,
        itemBuilder: (context,index){
          final todo = MyTodo.todos[index];
          return Todoitem(todo: todo,onChanged: (value){
            setState(() {
              MyTodo.todos[index].completed = value;
            });
          },);
        },
        ),
    );
  }
  
  void addTodo() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
    isScrollControlled: true,
     builder: (context)=>StatefulBuilder(
       builder:(context, setBuilderState) =>Padding(
        padding: const EdgeInsets.all(16),
         child: Column(
          children: [
          TextField(
            cursorColor: Colors.tealAccent,
            controller: _controller,
            decoration: const InputDecoration(
            iconColor: Colors.tealAccent,
              icon: Icon(Icons.checklist_outlined),
              hintText: 'Add Todo',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Select Priority'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<todoPriority>(
                  activeColor: Colors.tealAccent,
                  value: todoPriority.Low,
                  groupValue: priority,
                  onChanged: (value){
                    setBuilderState(() {
                      priority = value!;
                    });
                  },
                ),
                Text(todoPriority.Low.name),
                 Radio<todoPriority>(
                  activeColor: Colors.tealAccent,
                  value: todoPriority.Medium,
                  groupValue: priority,
                  onChanged: (value){
                    setBuilderState(() {
                      priority = value!;
                    });
                  },
                ),
                Text(todoPriority.Medium.name),
                 Radio<todoPriority>(
                  activeColor: Colors.tealAccent,
                  value: todoPriority.High,
                  groupValue: priority,
                  onChanged: (value){
                    setBuilderState(() {
                      priority = value!;
                    });
                  },
                ),
                Text(todoPriority.High.name),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )
              ),
              onPressed: _save,
              child: const Text('Save'),
            ),
          ],
             ),
       ),
     ),
    );
  }

  void _save() {
    if(_controller.text.isEmpty) {
    showDialog(
      context: context, builder: (context) =>  AlertDialog(
        title: const Text('Input field is empty'),
        content: const Text('Please enter some todos'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:const Text('close'),
            ),
        ],
      ),
      );
      return;
      }
      final todo=MyTodo(
        id: DateTime.now().microsecondsSinceEpoch,
         name: _controller.text, 
         priority: priority,
        );
        MyTodo.todos.add(todo);
        setState(() {
        });
        Navigator.pop(context);
        _controller.clear();
  }
}