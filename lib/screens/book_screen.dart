import 'package:booky/models/BookComment.dart';
import 'package:booky/screens/write_review_screen.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  static const screenRoute = '/booker';

  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  int userRating = 0;

  void movetoreviewwriting(BuildContext ctx, String bookid, String author,
      double myrating, String photoId, String title) {
    Navigator.of(ctx).pushNamed(
      // The page which I will open
      WriteReviewScreen.screenRoute,
      arguments: {
        'id': bookid,
        'photoid': photoId,
        'title': title,
        'Author': author,
        'myrating': myrating, // Pass as a double instead of int
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Receive the argument from the previous screen
    // final routeArgument =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    // final mycurrentBookTitle = routeArgument['title'] as String;
    // final mycurrentbookId = routeArgument['id'] as String;
    // final mycurrentPhotoId = routeArgument['photoid'] as String;
    // final mycurrentRating = double.tryParse(routeArgument['rating'] ?? '0.0') ??
    //     0.0; // Ensure it's parsed as double, with default 0.0
    // final myCurrentNumberOfPages = routeArgument['numberOfpages'];
    // final myCurrentAuthor = routeArgument['Author'];

    // // Deserialize comment from the Map
    // final commentMap = routeArgument['bookComment'] as Map<String, dynamic>;
    // final myCurrentComment = BookComment.fromMap(commentMap);
    // Safely retrieve route arguments and provide a default empty map if null
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
            {};

    // Assign default values for each expected argument to prevent null errors
    final mycurrentBookTitle =
        routeArgument['title'] as String? ?? 'Unknown Title';
    final mycurrentbookId = routeArgument['id'] as String? ?? 'unknown_id';
    final mycurrentPhotoId = routeArgument['photoid'] as String? ??
        'assets/images/default_photo.jpg';
    final mycurrentRating =
        double.tryParse(routeArgument['rating']?.toString() ?? '0.0') ?? 0.0;
    final myCurrentNumberOfPages = routeArgument['numberOfpages'] ?? 'N/A';
    final myCurrentAuthor =
        routeArgument['Author'] as String? ?? 'Unknown Author';

    // Deserialize comment with a default empty map if bookComment is null
    final commentMap =
        routeArgument['bookComment'] as Map<String, dynamic>? ?? {};
    final myCurrentComment = BookComment.fromMap(commentMap);
    return Scaffold(
      appBar: AppBar(
        title: Text(mycurrentBookTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // Book cover section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    mycurrentPhotoId,
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Author: John Doe',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Genre: Fiction',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Rating: $mycurrentRating/5',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Book pages and eBook section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.book, size: 24),
                    Text(
                      'eBook',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pages: $myCurrentNumberOfPages',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.family_restroom),
                      onPressed: () {},
                      iconSize: 24,
                    ),
                    Text(
                      'For Family',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Buy/Read button
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue, onPrimary: Colors.white),
              onPressed: () {},
              child: Text('Buy or Read Now'),
            ),
          ),

          // About this book section
          TitleAndArrowWidget(
              mytitle: 'About this Book',
              subtittle: '',
              is_button_exsist: true),

          // Series button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.grey,
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.grey),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            ),
            onPressed: () {},
            child: Text(
              'Series',
              style: TextStyle(fontSize: 14),
            ),
          ),

          // Rating display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  mycurrentRating.toString(),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        if (index < mycurrentRating.floor()) {
                          return Icon(Icons.star, color: Colors.blue);
                        } else if (index < mycurrentRating &&
                            index < mycurrentRating.ceil()) {
                          return Icon(Icons.star_half, color: Colors.blue);
                        } else {
                          return Icon(Icons.star_border, color: Colors.blue);
                        }
                      }),
                    ),
                    SizedBox(height: 4),
                    Text(
                      mycurrentRating.floor().toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Comment Section
          Comment(
            mycurrentRating: mycurrentRating,
            myCurrentComment: myCurrentComment,
          ),

          // About the Author section
          TitleAndArrowWidget(
            mytitle: 'About the Author',
            subtittle: myCurrentAuthor,
            is_button_exsist: true,
          ),

          TitleAndArrowWidget(
            mytitle: 'express your point of view',
            subtittle: myCurrentAuthor,
            is_button_exsist: false,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Rating',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < userRating ? Icons.star : Icons.star_border,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          userRating = index + 1;
                        }); // Navigate to the review writing page with the updated rating
                        movetoreviewwriting(
                            context,
                            mycurrentbookId,
                            myCurrentAuthor,
                            mycurrentRating, // Pass the correct rating type (double)
                            mycurrentPhotoId,
                            mycurrentBookTitle);
                      },
                    );
                  }),
                ), // Write a Review Button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.white),
                    onPressed: () {
                      // Navigate to the review writing page with the updated rating
                      movetoreviewwriting(
                          context,
                          mycurrentbookId,
                          myCurrentAuthor,
                          mycurrentRating, // Pass the correct rating type (double)
                          mycurrentPhotoId,
                          mycurrentBookTitle);
                    },
                    child: Text('Write a Review'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TitleAndArrowWidget extends StatelessWidget {
  const TitleAndArrowWidget(
      {super.key,
      required this.mytitle,
      required this.subtittle,
      required this.is_button_exsist});

  final String mytitle;
  final String subtittle;
  final bool is_button_exsist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mytitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  if (subtittle.isNotEmpty)
                    Text(
                      subtittle.toLowerCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                            .withOpacity(0.5), // Adjust opacity here
                      ),
                    ),
                ],
              ),
              if (is_button_exsist)
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward, color: Colors.black),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final BookComment myCurrentComment;
  final double mycurrentRating;

  const Comment({
    super.key,
    required this.myCurrentComment,
    required this.mycurrentRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/images/page1.jpeg"), // Use the correct image path for user photo
                radius: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  myCurrentComment.user,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < mycurrentRating ? Icons.star : Icons.star_border,
                color: Colors.blue,
                size: 20,
              );
            }),
          ),
          SizedBox(height: 8),
          Text(
            myCurrentComment.content.toLowerCase(),
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('Was this review helpful?'),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('No'),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See all reviews',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
