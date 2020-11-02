import 'package:book_test/entity/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

Future<Book> askToCreateBook(BuildContext context) async {
  return await showDialog<Book>(
    context: context,
    builder: (context) {
      return _SaveBookDialog(book: null);
    },
  );
}

Future<Book> askToEditBook(BuildContext context, Book book) async {
  return await showDialog<Book>(
    context: context,
    builder: (context) {
      return _SaveBookDialog(book: book);
    },
  );
}

class _SaveBookDialog extends StatefulWidget {
  final Book book;

  _SaveBookDialog({
    this.book,
    Key key,
  }) : super(key: key);

  @override
  _SaveBookDialogState createState() => _SaveBookDialogState();
}

@immutable
class _CreatingBook {
  final String author;
  final String title;
  final String year;

  _CreatingBook({
    this.author,
    this.title,
    this.year,
  });

  bool isValid() {
    print(
        "isValid ${author.trim().isNotEmpty} ${title.trim().isNotEmpty} ${int.tryParse(year.trim()) != null}");
    return author.trim().isNotEmpty &&
        title.trim().isNotEmpty &&
        int.tryParse(year.trim()) != null;
  }

  Book toBook(String uuid) => Book(
        uuid: uuid ?? Uuid().v4(),
        author: author.trim(),
        title: title.trim(),
        year: int.parse(year.trim()),
      );
}

class _SaveBookDialogState extends State<_SaveBookDialog> {
  TextEditingController authorController;
  TextEditingController titleController;
  TextEditingController yearController;

  final titleFocusNode = FocusNode();
  final yearFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    authorController = TextEditingController(text: widget.book?.author);
    titleController = TextEditingController(text: widget.book?.title);
    yearController = TextEditingController(text: widget.book?.year?.toString());
  }

  @override
  Widget build(BuildContext context) {
    final creatingBook = _CreatingBook(
      author: authorController.text,
      title: titleController.text,
      year: yearController.text,
    );
    return AlertDialog(
      title: Text(
        widget.book != null ? "Редактирование книги" : "Новая книга",
        key: ValueKey("dialog_title"),
      ),
      content: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                key: ValueKey("author"),
                controller: authorController,
                decoration: InputDecoration(
                  hintText: "Автор",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                maxLength: 128,
                maxLines: 1,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => titleFocusNode.requestFocus(),
                onChanged: (s) => setState(() {}),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                key: ValueKey("title"),
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Название",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.book_rounded),
                ),
                maxLength: 128,
                maxLines: 1,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => yearFocusNode.requestFocus(),
                focusNode: titleFocusNode,
                onChanged: (s) => setState(() {}),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                key: ValueKey("year"),
                controller: yearController,
                decoration: InputDecoration(
                  hintText: "Год",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                maxLength: 4,
                maxLines: 1,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                focusNode: yearFocusNode,
                onChanged: (s) => setState(() {}),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          key: ValueKey("cancel"),
          onPressed: () => Navigator.pop(context, null),
          child: Text("Отмена"),
        ),
        TextButton(
          key: ValueKey("save"),
          onPressed: creatingBook.isValid()
              ? () => Navigator.pop(
                    context,
                    creatingBook.toBook(widget.book?.uuid),
                  )
              : null,
          child: Text("Сохранить"),
        ),
      ],
    );
  }
}
