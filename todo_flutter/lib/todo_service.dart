class Todo {
  int id;
  String task;
  bool finished;

  Todo({required this.id, required this.task, required this.finished});
}

class TodoService {
  List<Todo> list = [
    Todo(id:0, task: "Test", finished: false)
  ];

  void addTodo(String task, int id) {
    final todo = Todo(id: id, task: task, finished: false);
    list.add(todo);
  }
  void finishTaskSet(int id, bool status){
    list = list.map((e) {
      if (e.id == id) {
        return Todo(id: e.id, task: e.task, finished: status);
      }
      return e;
    }).toList();
  }
  void deleteTask(int id){
    int todoIndex = list.indexWhere((element) => element.id == id);
    if(todoIndex < 0) return;
    list.remove(list[todoIndex]);
  }
}
