import 'package:booky/models/BooksData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatelessWidget {
  // Sample data for demonstration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books")),
      body: ListView.builder(
        scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
        itemCount: books.length, // Number of books
        itemBuilder: (context, index) {
          final book = books[index]; // Get the current book
          return Container(
            width: 150, // Set a fixed width for each book item

            margin: EdgeInsets.symmetric(
                horizontal: 8.0), // Add some spacing between items
            child: Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to the start
                children: [
                  Image.asset(
                    book.photoId, // Use the image asset path from the book model
                    fit: BoxFit
                        .cover, // Cover the entire container while maintaining aspect ratio
                    height: 100, // Set a fixed height for the image
                    width: double.infinity, // Make the image take full width
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      book.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(book.summary),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
