
class MyTodo{
int id;
String  name;
bool completed;
todoPriority priority;

MyTodo({required this.id,required this.name, this.completed=false,required this.priority,});
static  List<MyTodo> todos=[];
}
enum todoPriority {Low,Medium,High}