class Todo {
  final String id;
  final String title;
  final String user1;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.user1,
    this.isDone = false,
  });
}
