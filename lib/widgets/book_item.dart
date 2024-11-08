import 'package:flutter/material.dart';

import '../models/Book.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    required this.mybook,
  });

  final Book mybook;
//final string  titile;
//final string image url
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Set a fixed width for the book card
      margin: const EdgeInsets.symmetric(
          horizontal: 8), // Add horizontal spacing between cards
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Match card radius
              child: Image.asset(
                mybook.photoId,
                fit: BoxFit.cover, // Ensure the image covers the entire area
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
                    fontSize: 10, // Aajust font size as needed
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
