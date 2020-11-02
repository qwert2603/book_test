import 'package:meta/meta.dart';

@immutable
class Book {
  final String uuid;
  final String author;
  final String title;
  final int year;

  Book({
    @required this.uuid,
    @required this.author,
    @required this.title,
    @required this.year,
  });

  @override
  String toString() {
    return 'Book{id: $uuid, author: $author, title: $title, year: $year}';
  }
}
