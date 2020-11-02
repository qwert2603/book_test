import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_driver_helper/flutter_driver_helper.dart';

class BooksListScreen extends BaseScreen {
  BooksListScreen(FlutterDriver driver) : super(driver);

  DWidget bookTitle(int index) => dWidget("book_title_$index");

  DWidget bookSubtitle(int index) => dWidget("book_subtitle_$index");

  DWidget get createBook => dWidget("create_book");
}

class BookDetailsScreen extends BaseScreen {
  BookDetailsScreen(FlutterDriver driver) : super(driver);

  DWidget get title => dWidget("title");

  DWidget get author => dWidget("author");

  DWidget get year => dWidget("year");

  DWidget get remove => dWidget("remove");

  DWidget get edit => dWidget("edit");
}

class RemoveBookScreen extends BaseScreen {
  RemoveBookScreen(FlutterDriver driver) : super(driver);

  DWidget get dialogContent => dWidget("dialog_content");

  DWidget get cancel => dWidget("cancel");

  DWidget get remove => dWidget("remove");
}

class SaveBookScreen extends BaseScreen {
  SaveBookScreen(FlutterDriver driver) : super(driver);

  DWidget get dialogTitle => dWidget("dialog_title");

  DWidget get author => dWidget("author");

  DWidget get title => dWidget("title");

  DWidget get year => dWidget("year");

  DWidget get cancel => dWidget("cancel");

  DWidget get save => dWidget("save");
}
