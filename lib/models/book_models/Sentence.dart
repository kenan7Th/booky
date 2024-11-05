import 'package:booky/models/book_models/Word.dart';

class Sentence {
  final sentece_id;
  //Array of Words
  final List<Word> words;
  Sentence({required this.sentece_id, required this.words});
}
