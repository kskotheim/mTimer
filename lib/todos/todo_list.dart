import 'package:mobx/mobx.dart';
import 'todo.dart';

part 'todo_list.g.dart';

enum VisibilityFilter {all, pending, completed}

class TodoList = _TodoList with _$TodoList;

abstract class _TodoList with Store {
  @observable
  var todos = ObservableList<Todo>();

  @observable
  var filter = VisibilityFilter.all;

  @observable
  var currentDescription = '';

  @computed
  ObservableList<Todo> get pendingTodos => ObservableList.of(todos.where((todo) => todo.done != true));

  @computed
  ObservableList<Todo> get completedTodos => ObservableList.of(todos.where((todo) => todo.done == true));

  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  String get itemsDescription {
    if(todos.isEmpty){
      return "There are no todos";
    }
    final suffix = pendingTodos.length == 1 ? 'todo' : 'todos';
    return '${pendingTodos.length} $suffix pending, ${completedTodos.length} completed';
  }

  @computed
  ObservableList<Todo> get visibleTodos {
    switch(filter){
      case VisibilityFilter.pending:
        return pendingTodos;
      case VisibilityFilter.completed:
        return completedTodos;
      default:
        return todos;
    }
  }

  @computed
  bool get canRemoveAllComplted => hasCompletedTodos && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllCompleted => hasPendingTodos && filter != VisibilityFilter.completed;


  @action
  void addTodo(String description) {
    final todo = Todo(description);
    todos.add(todo);
    currentDescription = '';
  }
  
  @action
  void removeTodo(Todo todo){
    todos.removeWhere((x) => x == todo);
  }

  @action
  void changeDescription(String description) => currentDescription = description;

  @action
  void changeFilter(VisibilityFilter filter) => this.filter = filter;

  @action
  void removeCompleted(){
    todos.removeWhere((todo) => todo.done);
  }

  @action
  void markAllAsCompleted(){
    for(final todo in todos){
      todo.done = true;
    }
  }
}