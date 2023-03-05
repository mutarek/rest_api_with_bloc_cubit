import 'dart:convert';
import 'package:bloc_rest_api/app/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    if (response.statusCode == 200) {
      final myjson = jsonDecode(response.body) as List;
      final result = myjson.map((e) {
        return TodoModel(userId: e['userId'], id: e['id'], title: e['title'], completed: e['completed']);
      }).toList();
      return result;
    } else {
      throw "Api error";
    }
  }
}
