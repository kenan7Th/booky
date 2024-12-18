import 'package:booky/screens/HomePage.dart';
import 'package:booky/screens/book_screen.dart';
import 'package:booky/screens/write_review_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        BookScreen.screenRoute: (context) => BookScreen(),
        WriteReviewScreen.screenRoute: (context) => WriteReviewScreen(),
      },
    );
  }
}
