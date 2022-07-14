import 'package:flutter/material.dart';
import 'package:google_books_app/Controller/book_detail_controller.dart';
import 'package:google_books_app/Controller/book_search_controller.dart';
import 'package:google_books_app/Screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookSearchController(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookDetailController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
