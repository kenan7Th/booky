import 'package:flutter/material.dart';

class BookDetailesScreen extends StatelessWidget {
  final String my_current_bookId;
  final String my_current_bookTitle;
  final String my_current_bookphot;

  const BookDetailesScreen(this.my_current_bookId, this.my_current_bookTitle,
      this.my_current_bookphot);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hh"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/page1.jpeg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "gf",
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
