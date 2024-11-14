import 'package:flutter/material.dart';

class WriteReviewScreen extends StatefulWidget {
  static const screenRoute = '/writeReview';

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  double _userRating = 0.0; // Initial rating
  int maxChars = 1000; // Maximum character limit

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final routeArgument =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
              {};
      final mycurrentRating =
          double.tryParse(routeArgument['rating']?.toString() ?? '0.0') ?? 0.0;
      setState(() {
        _userRating = mycurrentRating;
      });
    });

    // Add a listener to update the UI when text changes
    _reviewController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submitReview() {
    final reviewText = _reviewController.text.trim();
    final rating = _userRating;

    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please write a review before submitting!")),
      );
      return;
    }

    // TODO: Add logic to store the review and rating
    print("Review: $reviewText");
    print("Rating: $rating");

    _reviewController.clear();
    setState(() {
      _userRating = 0.0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Review submitted successfully!")),
    );
  }

  // Function to update rating based on user tap
  void _updateRating(double rating) {
    setState(() {
      _userRating = rating;
    });
    print("User Rating: $_userRating"); // Print statement to track rating
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        return IconButton(
          onPressed: () {
            _updateRating(starIndex.toDouble());
          },
          icon: Icon(
            starIndex <= _userRating ? Icons.star : Icons.star_border,
            color: Colors.deepPurple,
            size: 30,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
            {};
    final mycurrentPhotoId =
        routeArgument['photoid'] as String? ?? 'assets/images/photo1.jpeg';
    final myCurrentAuthor =
        routeArgument['Author'] as String? ?? 'Unknown Author';
    final mycurrentBookTitle =
        routeArgument['title'] as String? ?? 'Unknown Title';

    return Scaffold(
      appBar: AppBar(
        title: Text("Write a Review"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book information section with cover, title, and author
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      mycurrentPhotoId,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mycurrentBookTitle,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          myCurrentAuthor,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Star rating system
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Rating:',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 8),
                  _buildStarRating(),
                ],
              ),
            ),

            // Review input field with character limit and counter
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _reviewController,
                    maxLines: 5,
                    maxLength: maxChars, // Character limit
                    decoration: InputDecoration(
                      hintText: 'Write your review here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      contentPadding: EdgeInsets.all(16),
                    ),
                    textDirection: TextDirection.rtl, // Allow Arabic text
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            // Submit review button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _submitReview,
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Submit Review',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
