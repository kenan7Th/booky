import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  static const screenRoute = '/booker';

  @override
  Widget build(BuildContext context) {
    // To receive the argument from the previous screen
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    //final mycurrent_bookid = routeArgument['id'];
    final mycurrent_booktitle = routeArgument['title'];
    final mycurrent_photoid = routeArgument['photoid'];

    return Scaffold(
      appBar: AppBar(
        title: Text(mycurrent_booktitle!),
      ),
      body: ListView(
        children: [
          // Book cover section (Assuming `mycurrent_photoid` is an image URL or asset)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Circular square image (rounded rectangle)
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      16), // Adjust this for the rounded corners
                  child: Image.asset(
                    mycurrent_photoid!, // Replace with your actual image asset or URL
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),

                // Information next to the image
                SizedBox(width: 10), // Space between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author: John Doe', // Example text
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Genre: Fiction', // Example text
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Rating: 4.5/5', // Example text
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Book pages and ebook section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Ebook Available Icon and Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons
                            .book, // Replace with a relevant ebook icon if needed
                        size: 24,
                      ),
                      Text(
                        'eBook',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: 8), // space between icon and text
                      // Text(
                      //   'Available: Yes',
                      //   style: TextStyle(fontSize: 16),
                      // ),
                    ],
                  ),

                  // Flexible space between the Ebook section and Pages section
                  Flexible(child: Container()), // This will push the next item

                  // Pages Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pages: 320',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  // Flexible space between Pages text and Home icon
                  Flexible(
                      child:
                          Container()), // This will push the home icon to the right

                  // Home Icon Button
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.family_restroom), // Home icon
                          onPressed: () {
                            // Add functionality for the home button
                          },
                          iconSize: 24,
                        ),
                        Text(
                          'For Family',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button section (e.g., Purchase or Read Now)
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary:
                      Colors.white // Set the button's background color to blue
                  ),
              onPressed: () {
                // Implement the button action here
              },
              child: Text('Buy or Read Now'),
            ),
          ),

          // About this book section
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About this Book',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'This is a sample book description that will provide details about the content of the book.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
//type button
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary:
                      Colors.white // Set the button's background color to blue
                  ),
              onPressed: () {
                // Implement the button action here
              },
              child: Text('Buy or Read Now'),
            ),
          ),

//Raitng and revieiws
          Container(),
//comments List view and add more
          Container(),
//rate thsi ebook container
          Container(
              //text1
              //text 2
              //five stars icons array
              //write a review
              ),

          // More by this author (horizontal list view)
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'More by this Author',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildAuthorBookItem('Book 1'),
                      _buildAuthorBookItem('Book 2'),
                      _buildAuthorBookItem('Book 3'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Similar ebooks section
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar Ebooks',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildSimilarBookItem('Similar Book 1'),
                      _buildSimilarBookItem('Similar Book 2'),
                      _buildSimilarBookItem('Similar Book 3'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Google refund policy section
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Google Refund Policy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'For information about Google\'s refund policy, please refer to the official guidelines.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create horizontal list items (More by author)
  Widget _buildAuthorBookItem(String title) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://via.placeholder.com/100', // Placeholder image for book
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Helper method to create similar books list items
  Widget _buildSimilarBookItem(String title) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://via.placeholder.com/100', // Placeholder image for book
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class BookScreen extends StatelessWidget {
//   // final String bookId;
//   // final String booktitle;
//   // const BookScreen({required this.bookId, required this.booktitle});
//   // final Book mycurrentbook;

//   // const BookScreen({required this.mycurrentbook});
//   static const screenRoute = '/booker';

//   @override
//   Widget build(BuildContext context) {
//     //to recieve the argument
//     final routeArgument =
//         ModalRoute.of(context)?.settings.arguments as Map<String, String>;
//     final mycurrent_bookid = routeArgument['id'];
//     final mycurrent_booktitle = routeArgument['title'];
//     final mycurrent_photoid = routeArgument['photoid'];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(mycurrent_bookid!),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(mycurrent_photoid!),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 mycurrent_booktitle!,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
