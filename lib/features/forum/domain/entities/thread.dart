class Thread {
  final String id;
  final String title;
  final String body;
  final String snippet;
  final String categoryId;
  final String author;
  final DateTime createdAt;

  Thread({
    required this.id,
    required this.title,
    required this.body,
    required this.snippet,
    required this.categoryId,
    required this.author,
    required this.createdAt,
  });
}
