import 'package:book_test/entity/book.dart';
import 'package:book_test/repo/books_repo.dart';
import 'package:book_test/routes.dart';
import 'package:book_test/dialogs/save_book.dart';
import 'package:flutter/material.dart';

class BooksListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booksRepo = context.booksRepo;
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Test"),
      ),
      body: StreamBuilder<List<Book>>(
        stream: booksRepo.observeBooks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Загрузка.."),
            );
          }
          final booksList = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, i) => BookItem(book: booksList[i]),
            itemCount: booksList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newBook = await askToCreateBook(context);
          if (newBook != null) {
            booksRepo.saveBook(newBook);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final Book book;

  BookItem({
    @required this.book,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${book.title} (${book.year})"),
      subtitle: Text(book.author),
      onTap: () => Navigator.pushNamed(
        context,
        Routes.bookDetails,
        arguments: book.uuid,
      ),
    );
  }
}
