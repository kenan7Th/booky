class BookComment {
  final String comment_id;
  final String user;
  final String content;

  BookComment(
      {required this.comment_id, required this.user, required this.content});

  // Convert the object to a Map to pass as an argument
  Map<String, dynamic> toMap() {
    return {
      'comment_id': comment_id,
      'user': user,
      'content': content,
    };
  }

  // Create a BookComment object from a Map
  factory BookComment.fromMap(Map<String, dynamic> map) {
    return BookComment(
      comment_id: map['comment_id'],
      user: map['user'],
      content: map['content'],
    );
  }
}
