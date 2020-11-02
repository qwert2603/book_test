import 'package:book_test/entity/book.dart';
import 'package:book_test/dialogs/remove_book.dart';
import 'package:book_test/dialogs/save_book.dart';
import 'package:flutter/material.dart';
import 'package:book_test/repo/books_repo.dart';

class BookDetailsScreen extends StatelessWidget {
  final String bookUuid;

  BookDetailsScreen({
    @required this.bookUuid,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksRepo = context.booksRepo;
    return Scaffold(
      appBar: AppBar(title: Text("Книга")),
      body: StreamBuilder<List<Book>>(
        stream: booksRepo.observeBooks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Загрузка.."),
            );
          }
          final book = snapshot.data.firstWhere(
            (b) => b.uuid == bookUuid,
            orElse: () => null,
          );
          if (book == null) {
            return Container();
          }
          final textTheme = Theme.of(context).textTheme;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: textTheme.headline4,
                ),
                const SizedBox(height: 8.0),
                Text(
                  book.year.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                Text(
                  book.author,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        final confirmed = await askToRemoveBook(context, book);
                        if (confirmed == true) {
                          booksRepo.removeBook(book.uuid);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Удалить"),
                    ),
                    const SizedBox(width: 24.0),
                    TextButton(
                      onPressed: () async {
                        final edited = await askToEditBook(context, book);
                        if (edited != null) {
                          booksRepo.saveBook(edited);
                        }
                      },
                      child: Text("Редактировать"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
