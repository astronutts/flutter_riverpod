import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study_0915/models/todo_model.dart';
import 'package:flutter_study_0915/repos/todo_repo.dart';

class ToDoViewModel extends Notifier<ToDoModel> {
  final ToDoRepository _repository;

  ToDoViewModel(this._repository);

  @override
  ToDoModel build() {
    return ToDoModel(todo: 'helloWorld', like: _repository.isLike());
  }

  void setTodo(String value) {
    _repository.setTodo(value);
    state = ToDoModel(todo: value, like: state.like);
  }

  void setLike(bool value) {
    _repository.setLike(value);
    state = ToDoModel(todo: state.todo, like: value);
  }
}

final todoList = StateProvider((ref) => []);

final todoProvider = NotifierProvider<ToDoViewModel, ToDoModel>(
  () => throw UnimplementedError(),
);
