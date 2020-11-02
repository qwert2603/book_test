import 'package:book_test/entity/book.dart';
import 'package:flutter/material.dart';

Future<bool> askToRemoveBook(BuildContext context, Book book) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Удалить книгу?"),
        content: Text("${book.title} (${book.year}), ${book.author}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Отмена"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Удалить"),
          ),
        ],
      );
    },
  );
}
