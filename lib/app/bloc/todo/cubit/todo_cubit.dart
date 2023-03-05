import 'package:bloc_rest_api/app/bloc/todo/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repo/todo_repo.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super(InitTodoState());

  Future<void> fetchTodos() async {
    emit(LoadingState());
    try {
      final response = await todoRepository.getTodos();
      emit(ResponseState(response));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
