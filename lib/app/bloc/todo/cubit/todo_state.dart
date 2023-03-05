import 'package:bloc_rest_api/app/model/todo_model.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingState extends TodoState {}

class ErrorState extends TodoState {
  final String message;

  ErrorState(this.message);
}

class ResponseState extends TodoState {
  List<TodoModel> todos;

  ResponseState(this.todos);
}
