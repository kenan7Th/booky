import 'package:booky/models/Book.dart';
import 'package:booky/models/BookComment.dart';
import 'package:booky/models/book_models/BookPage.dart';
import 'package:booky/models/book_models/Chapter.dart';
import 'package:booky/models/book_models/Sentence.dart';
import 'package:booky/models/book_models/Word.dart';

final List<Book> books = [
  Book(
    id: "1",
    title: "Flutter Basics",
    price: "29.99",
    type: "Programming",
    isAudio: false,
    AIexpectedTime: "5 hours",
    language: "English",
    rating: "4.5",
    isForFamily: true,
    hasSeries: false,
    bookComment:
        BookComment(comment_id: "1", user: "kenan", content: "content"),
    summary: "An introduction to Flutter development.",
    isPurchased: true,
    photoId: "assets/images/page1.jpeg", // Update with the correct path
    isFree: false,
    isFreeSample: true,
    discountRate: 10,
    isLike: true,
    isDisLike: false,
    chapters: [
      Chapter(
        chapter_id: "1",
        title: "Introduction",
        pages: [
          BookPage(
            book_page_id: "1",
            sentences: [
              Sentence(sentece_id: "1", words: [
                Word(word_id: "1", content: "Hello"),
                Word(word_id: "2", content: "World"),
              ]),
              Sentence(sentece_id: "2", words: [
                Word(word_id: "3", content: "family"),
                Word(word_id: "4", content: " is "),
              ]),
            ],
          ),
        ],
      ),
    ],
  ),
  // Add more books here
  Book(
    id: "2",
    title: "Dart Programming",
    price: "19.99",
    type: "Programming",
    isAudio: false,
    AIexpectedTime: "3 hours",
    language: "English",
    rating: "4.0",
    isForFamily: true,
    hasSeries: false,
    bookComment:
        BookComment(comment_id: "2", user: "john", content: "Great book!"),
    summary: "Learn Dart programming from scratch.",
    isPurchased: false,
    photoId: "assets/images/page1.jpeg", // Update with the correct path
    isFree: true,
    isFreeSample: true,
    discountRate: 0,
    isLike: false,
    isDisLike: true,
    chapters: [],
  ),
  // Repeat for more books (3 to 7)
  Book(
    id: "3",
    title: "Advanced Flutter",
    price: "39.99",
    type: "Programming",
    isAudio: false,
    AIexpectedTime: "6 hours",
    language: "English",
    rating: "4.8",
    isForFamily: true,
    hasSeries: false,
    bookComment: BookComment(
        comment_id: "3", user: "alice", content: "Very informative."),
    summary: "Deep dive into Flutter's advanced features.",
    isPurchased: false,
    photoId: "assets/images/photo1.jpeg", // Update with the correct path
    isFree: false,
    isFreeSample: false,
    discountRate: 15,
    isLike: true,
    isDisLike: false,
    chapters: [],
  ),
  Book(
      id: "4",
      title: " Python programming Python",
      price: "25.00",
      type: "Programming",
      isAudio: false,
      AIexpectedTime: "4 hours",
      language: "English",
      rating: "4.2",
      isForFamily: true,
      hasSeries: false,
      bookComment: BookComment(
          comment_id: "4", user: "bob", content: "Great for beginners."),
      summary: " Python programming.",
      isPurchased: false,
      photoId: "assets/images/page1.jpeg", // Update with the correct path
      isFree: true,
      isFreeSample: true,
      discountRate: 5,
      isLike: true,
      isDisLike: false,
      chapters: []),
  Book(
      id: "5",
      title: "Learning Python",
      price: "30.00",
      type: "Programming",
      isAudio: false,
      AIexpectedTime: "5 hours",
      language: "English",
      rating: "4.6",
      isForFamily: true,
      hasSeries: false,
      bookComment: BookComment(
          comment_id: "5",
          user: "charlie",
          content: "A must-read for web developers."),
      summary: "Master JavaScript in no time.",
      isPurchased: true,
      photoId: "assets/images/page1.jpeg", // Update with the correct path
      isFree: false,
      isFreeSample: true,
      discountRate: 0,
      isLike: true,
      isDisLike: false,
      chapters: []),
  Book(
      id: "6",
      title: "React Native Guide",
      price: "45.00",
      type: "Programming",
      isAudio: false,
      AIexpectedTime: "8 hours",
      language: "English",
      rating: "4.9",
      isForFamily: true,
      hasSeries: false,
      bookComment: BookComment(
          comment_id: "6",
          user: "dave",
          content: "Excellent resource for mobile developers."),
      summary: "Build mobile apps using React Native.",
      isPurchased: false,
      photoId: "assets/images/page1.jpeg", // Update with the correct path
      isFree: false,
      isFreeSample: false,
      discountRate: 0,
      isLike: true,
      isDisLike: false,
      chapters: []),
  Book(
      id: "7",
      title: "Kotlin for Beginners",
      price: "35.00",
      type: "Programming",
      isAudio: false,
      AIexpectedTime: "7 hours",
      language: "English",
      rating: "4.7",
      isForFamily: true,
      hasSeries: false,
      bookComment: BookComment(
          comment_id: "7",
          user: "eve",
          content: "Great introduction to Kotlin."),
      summary: "Start your journey with Kotlin programming.",
      isPurchased: true,
      photoId: "assets/images/photo1.jpeg", // Update with the correct path
      isFree: true,
      isFreeSample: true,
      discountRate: 0,
      isLike: true,
      isDisLike: false,
      chapters: []),
];
