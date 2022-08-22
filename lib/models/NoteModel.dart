// ignore: file_names
class Note {
  final int id;
  final String description;
  final String title;

  Note({required this.title, required this.description, required this.id});
  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'id': id};
  }
}
