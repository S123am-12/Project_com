import 'package:flutter/material.dart';
import 'package:mytodo/Model/todo.dart';
class Todoitem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;
  const Todoitem({super.key,required this.todo,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.tealAccent,
      hoverColor: Colors.tealAccent,
      title: Text(todo.name),
      subtitle: Text('Priority: ${todo.priority.name}'),
      value:todo.completed ,
      onChanged: (value){
        onChanged(value!);
      },
    );
  }
}