import 'package:book_test/screens/book_details.dart';
import 'package:book_test/screens/books_list.dart';
import 'package:book_test/data/books_repo_in_memory.dart';
import 'package:book_test/repo/books_repo.dart';
import 'package:book_test/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<BooksRepo>(
      create: (context) => BooksRepoInMemory(),
      child: MaterialApp(
        title: 'Book Test',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Routes.booksList,
        routes: {
          Routes.booksList: (context) => BooksListScreen(),
        },
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == Routes.bookDetails) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                final String bookUuid = settings.arguments;
                return BookDetailsScreen(bookUuid: bookUuid);
              },
            );
          }
          throw Exception("Unknown route ${settings.name}");
        },
      ),
    );
  }
}
