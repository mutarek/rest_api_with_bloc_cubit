import 'package:bloc_rest_api/app/bloc/todo/cubit/todo_cubit.dart';
import 'package:bloc_rest_api/app/repo/todo_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo/cubit/todo_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchTodos();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: BlocBuilder<TodoCubit,TodoState>(builder: (context,state){
        if(state is InitTodoState || state is LoadingState){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is ResponseState){
          final todos = state.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_,index){
              var data = todos[index];
              return ListTile(
                title: Text(data.title!),
              );
            },
          );
        }
        else if(state is ErrorState){
          final message = state.message;
          return Center(
            child: Text(message),
          );
        }
        return Text(state.toString());
      }),
    );
  }
}
