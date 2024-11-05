import 'package:booky/models/book_models/BookPage.dart';

class Chapter {
  final String chapter_id;
  final String title;
  final List<BookPage> pages; // List of Chapter objects

  //array of pages
  Chapter({
    required this.chapter_id,
    required this.title,
    required this.pages,
  });
}
