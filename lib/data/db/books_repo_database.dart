import 'package:book_test/data/db/tables.dart';
import 'package:book_test/entity/book.dart';
import 'package:book_test/repo/books_repo.dart';

class BooksRepoDatabase implements BooksRepo {
  final db = BooksDatabase();

  @override
  Stream<List<Book>> observeBooks() {
    return db.books().map(
      (booksList) => booksList
            .map(
              (bt) => Book(
                uuid: bt.uuid,
                author: bt.author,
                title: bt.title,
                year: bt.year,
              ),
            )
            .toList(),
    );
  }

  @override
  Future<void> removeBook(String uuid) => db.deleteBook(uuid);

  @override
  Future<void> saveBook(Book book) => db.saveBook(
        BookTableData(
          uuid: book.uuid,
          author: book.author,
          title: book.title,
          year: book.year,
        ),
      );
}
