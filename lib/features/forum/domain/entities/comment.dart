class Comment {
  final String id;
  final String threadId;
  final String author;
  final String body;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.threadId,
    required this.author,
    required this.body,
    required this.createdAt,
  });
}
