// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  final String title;
  final String description;
  bool isDone;

  TodoModel(
      {required this.title, required this.description, this.isDone = false});
}
