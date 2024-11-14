class BookReview {
  final String reviewId;
  final String readerId; // ID of the reader who wrote the review
  final String bookId; // ID of the book being reviewed
  final String reviewText;
  final int rating; // Rating out of 5
  final DateTime reviewDate;

  BookReview({
    required this.reviewId,
    required this.readerId,
    required this.bookId,
    required this.reviewText,
    required this.rating,
    required this.reviewDate,
  });

  // Factory constructor to create a BookReview from JSON
  factory BookReview.fromJson(Map<String, dynamic> json) {
    return BookReview(
      reviewId: json['reviewId'],
      readerId: json['readerId'],
      bookId: json['bookId'],
      reviewText: json['reviewText'],
      rating: json['rating'],
      reviewDate: DateTime.parse(json['reviewDate']),
    );
  }

  // Method to convert a BookReview to JSON
  Map<String, dynamic> toJson() {
    return {
      'reviewId': reviewId,
      'readerId': readerId,
      'bookId': bookId,
      'reviewText': reviewText,
      'rating': rating,
      'reviewDate': reviewDate.toIso8601String(),
    };
  }
}


// Relationships between Tables
// One-to-Many Relationship between User and Review: Each user can write multiple reviews, but each review is associated with only one user. This is represented by the foreign key user_id in the Review table pointing to the user_id in the User table.

// One-to-Many Relationship between Book and Review: Each book can have multiple reviews, but each review is for only one book. This is represented by the foreign key book_id in the Review table pointing to the book_id in the Book table.