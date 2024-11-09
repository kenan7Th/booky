import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  // final String bookId;
  // final String booktitle;
  // const BookScreen({required this.bookId, required this.booktitle});
  // final Book mycurrentbook;

  // const BookScreen({required this.mycurrentbook});
  static const screenRoute = '/booker';

  @override
  Widget build(BuildContext context) {
    //to recieve the argument
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mycurrent_bookid = routeArgument['id'];
    final mycurrent_booktitle = routeArgument['title'];
    final mycurrent_photoid = routeArgument['photoid'];

    return Scaffold(
      appBar: AppBar(
        title: Text(mycurrent_bookid!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(mycurrent_photoid!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                mycurrent_booktitle!,
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
