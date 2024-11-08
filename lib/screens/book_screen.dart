import 'package:booky/models/Book.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  // final String bookId;
  // final String booktitle;
  // const BookScreen({required this.bookId, required this.booktitle});
  final Book mycurrentbook;

  const BookScreen({required this.mycurrentbook});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mycurrentbook.id),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(mycurrentbook.photoId),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                mycurrentbook.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
