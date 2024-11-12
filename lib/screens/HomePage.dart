// import 'package:booky/models/BooksData.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(HomePage());
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BookListScreen(),
//     );
//   }
// }

// class BookListScreen extends StatelessWidget {
//   // Sample data for demonstration

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Books")),
//       body: Container(
//         child: listitiem(),
//       ),
//     );
//   }
// }

// class listitiem extends StatelessWidget {
//   const listitiem({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
//       itemCount: books.length, // Number of books
//       itemBuilder: (context, index) {
//         final book = books[index]; // Get the current book
//         return Container(
//           width: 150, // Set a fixed width for each book item

//           margin: EdgeInsets.symmetric(
//               horizontal: 8.0), // Add some spacing between items
//           child: Card(
//             elevation: 4.0,
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start, // Align items to the start
//               children: [
//                 Image.asset(
//                   book.photoId, // Use the image asset path from the book model
//                   fit: BoxFit
//                       .cover, // Cover the entire container while maintaining aspect ratio
//                   height: 100, // Set a fixed height for the image
//                   width: double.infinity, // Make the image take full width
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     book.title,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(book.summary),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:booky/models/Book.dart';
import 'package:booky/models/BooksData.dart';

import 'package:flutter/material.dart';

import 'book_screen.dart';

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
//stagee

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Books")),
        body: ListView(
          children: [
            TitleAndArrowContainer(),
//horizintal List
            HorizintalListviewSizeBox(),

            TitleAndArrowContainer(),
//horizintal List
            HorizintalListviewSizeBox(),
            TitleAndArrowContainer(),
//horizintal List
            HorizintalListviewSizeBox(),
            TitleAndArrowContainer(),
//horizintal List
            HorizintalListviewSizeBox(),
            TitleAndArrowContainer(),
//horizintal List
            HorizintalListviewSizeBox(),
          ],
        ));
  }
}

class HorizintalListviewSizeBox extends StatelessWidget {
  const HorizintalListviewSizeBox({
    super.key,
  });

  void selectBook(BuildContext ctx, Book cbook) {
    Navigator.of(ctx, rootNavigator: true).pushNamed(
        //the page which I will openn it
        BookScreen.screenRoute,
        arguments: {
          'id': cbook.id,
          'title': cbook.title,
          'photoid': cbook.photoId,
          'rating': cbook.rating,
          'numberOfpages': cbook.numberOfpages,
          'bookComment': cbook.bookComment.toMap() // Convert comment to a Map
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length, // Ensure books is defined
        itemBuilder: (context, index) {
          final mybook = books[index]; // Ensure books[index] is valid
          return InkWell(
            onTap: () =>
                selectBook(context, mybook), // Call selectBook with context
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 120, // Set a fixed width for the book card
              margin: const EdgeInsets.symmetric(
                  horizontal: 8), // Add horizontal spacing between cards
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8), // Match card radius
                      child: Image.asset(
                        mybook.photoId,
                        fit: BoxFit
                            .cover, // Ensure the image covers the entire area
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mybook.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 9, // Adjust font size as needed
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          mybook.price,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 10, // Adjust font size as needed
                          ),
                        ),
                      ],
                    ),
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

class TitleAndArrowContainer extends StatelessWidget {
  const TitleAndArrowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.center,
      color: Colors.white10,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // space between items
        children: [
          Text(
            "Books for Winter",
            style: TextStyle(
              fontWeight: FontWeight.bold, // bold text
              fontSize: 16,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            padding: EdgeInsets.zero, // removes padding around the icon
            constraints: BoxConstraints(), // removes any constraints
          ),
        ],
      ),
    );
  }
}

class listitiem extends StatelessWidget {
  const listitiem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
