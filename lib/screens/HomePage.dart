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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            final mybook = books[index];
            return Card(
              elevation: 4, // Adds shadow for a card effect
              margin: const EdgeInsets.all(8), // Margin around the card
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Rounded corners for the card
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container for the image with square aspect ratio
                  Container(
                    width: 100,
                    height: 100, // Set height equal to width for a square
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/photo1.jpeg"), // Use mybook.id for the image asset path
                        fit: BoxFit
                            .cover, // Cover the entire container while maintaining aspect ratio
                      ),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8)), // Rounded top corners
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  // Container for the text
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Padding around text
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to start
                        children: [
                          Text(
                            mybook.title, // Book name
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16), // Bold for book name
                          ),
                          SizedBox(height: 2), // Space between name and author
                          Text(mybook.summary), // Author name
                          SizedBox(height: 2), // Space between author and price
                          Text(
                            mybook.price, // Price
                            style: TextStyle(
                                color:
                                    Colors.green), // Optional styling for price
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
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
    return Expanded(
      child: Container(
        //height: 20,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.center,
        color: Colors.white10,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //space between Items
          children: [
            Text(
              "Books for Winter",
              style: TextStyle(
                  fontWeight: FontWeight.bold, //bold text
                  fontSize: 16),
            ),
            // ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         primary: Colors.white, onPrimary: Colors.black),
            //     child: Row(
            //       children: [
            //         Text(
            //           "",
            //         ),
            //         Icon(Icons.arrow_forward)
            //       ],
            //     )
            //     )
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              padding: EdgeInsets.zero, //removes padding around the icon
              constraints: BoxConstraints(), //removes any constraints
            )
          ],
        ),
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
