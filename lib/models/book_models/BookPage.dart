import 'package:booky/models/book_models/Sentence.dart';

class BookPage {
  final String book_page_id;
  final List<Sentence> sentences;

  BookPage({required this.book_page_id, required this.sentences});
  //array of sentence
}
