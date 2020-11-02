import 'dart:async';

import 'package:async/async.dart';
import 'package:book_test/entity/book.dart';
import 'package:book_test/repo/books_repo.dart';

class BooksRepoInMemory implements BooksRepo {
  List<Book> _books = [];

  final _broadcast = StreamController<List<Book>>.broadcast();

  @override
  Future<void> saveBook(Book book) async {
    final existingIndex = _books.indexWhere((b) => b.uuid == book.uuid);
    if (existingIndex >= 0) {
      _books = List.from(_books)
        ..replaceRange(
          existingIndex,
          existingIndex + 1,
          [book],
        );
    } else {
      _books = [book] + _books;
    }
    _broadcast.add(_books);
  }

  @override
  Future<void> removeBook(String uuid) async {
    _books = _books.where((b) => b.uuid != uuid).toList();
    _broadcast.add(_books);
  }

  @override
  Stream<List<Book>> observeBooks() => StreamGroup.merge([
        Stream.value(_books),
        _broadcast.stream,
      ]);
}
