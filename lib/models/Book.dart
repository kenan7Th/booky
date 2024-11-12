import 'package:booky/models/BookComment.dart';
import 'package:booky/models/book_models/Chapter.dart';

class Book {
  final String id;
  final String title;
  final String price;
  final String type;
  final bool isAudio;
  final String AIexpectedTime;
  final String language;
  final String rating;
  final bool isForFamily;
  final bool hasSeries;
  final BookComment bookComment;
  final String summary; // Note: Changed 'Summary' to 'summary' for consistency
  final bool isPurchased;
  final String photoId;
  final bool isFree;
  final bool isFreeSample;
  final int
      discountRate; // Note: Corrected spelling from 'dicountRate' to 'discountRate'
  final bool isLike;
  final bool isDisLike;
  final List<Chapter> chapters; // List of Chapter objects
  final int numberOfpages;
  // Constructor
  Book(
      {required this.id,
      required this.title,
      required this.price,
      required this.type,
      required this.isAudio,
      required this.AIexpectedTime,
      required this.language,
      required this.rating,
      required this.isForFamily,
      required this.hasSeries,
      required this.bookComment,
      required this.summary,
      required this.isPurchased,
      required this.photoId,
      required this.isFree,
      required this.isFreeSample,
      required this.discountRate,
      required this.isLike,
      required this.isDisLike,
      required this.chapters,
      required this.numberOfpages
      // Initialize chapters
      });
}
