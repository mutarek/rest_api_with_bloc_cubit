class TodoModel {
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel.fromJson(dynamic json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}
