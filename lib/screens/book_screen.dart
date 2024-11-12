import 'package:booky/models/BookComment.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  static const screenRoute = '/booker';

  @override
  Widget build(BuildContext context) {
    // Receive the argument from the previous screen
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final mycurrentBookTitle = routeArgument['title'] as String;
    final mycurrentPhotoId = routeArgument['photoid'] as String;
    final mycurrentRating = double.tryParse(routeArgument['rating']) ?? 0.0;
    final myCurrentNumberOfPages = routeArgument['numberOfpages'];

    // Deserialize comment from the Map
    final commentMap = routeArgument['bookComment'] as Map<String, dynamic>;
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
          Padding(
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
                  'This is a sample book description that provides details about the content of the book.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

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

          // Rating and reviews section
          // TitleAndArrowWidget('About this Book','' ');

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
        ],
      ),
    );
  }
}

class TitleAndArrowWidget extends StatelessWidget {
  const TitleAndArrowWidget({
    super.key,
    required this.mytitle,
    required this.subtittle,
  });

  final String mytitle;
  final String subtittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mytitle.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward, color: Colors.black),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
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
