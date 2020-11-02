import 'package:book_test/entity/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BooksRepo {
  Future<void> saveBook(Book book);

  Future<void> removeBook(String uuid);

  Stream<List<Book>> observeBooks();
}

extension BuildContextX on BuildContext {
  BooksRepo get booksRepo => Provider.of<BooksRepo>(this, listen: false);
}
