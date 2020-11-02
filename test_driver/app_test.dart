import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_driver_helper/flutter_driver_helper.dart';
import 'package:test/test.dart';

import 'screens.dart';
import 'util.dart';

void main() {
  FlutterDriver driver;
  Screenshoter screenshoter;

  group('scenario', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      screenshoter = Screenshoter(driver, "screens", enabled: true);
    });

    tearDownAll(() async {
      await driver?.close();
    });

    test(
      'test',
      () async {
        final booksListScreen = BooksListScreen(driver);
        final bookDetailsScreen = BookDetailsScreen(driver);
        final removeBookScreen = RemoveBookScreen(driver);
        final saveBookScreen = SaveBookScreen(driver);

        await runTestActions([
          step("create first book", [
            booksListScreen.bookTitle(0).waitForAbsent(),
            screenshoter.screenshot("empty_list"),
            booksListScreen.createBook.tap(),
            saveBookScreen.dialogTitle.hasText("Новая книга"),
            saveBookScreen.author.appendText("Author One"),
            saveBookScreen.title.appendText("Book One"),
            saveBookScreen.year.appendText("1918"),
            saveBookScreen.save.tap(),
            booksListScreen.bookTitle(0).hasText("Book One (1918)"),
            booksListScreen.bookSubtitle(0).hasText("Author One"),
            booksListScreen.bookTitle(1).waitForAbsent(),
          ]),
          step("create second book", [
            booksListScreen.createBook.tap(),
            saveBookScreen.dialogTitle.hasText("Новая книга"),
            saveBookScreen.author.appendText("Author Two"),
            saveBookScreen.title.appendText("Book Two"),
            saveBookScreen.year.appendText("2020"),
            screenshoter.screenshot("create_book"),
            saveBookScreen.save.tap(),
            booksListScreen.bookTitle(0).hasText("Book Two (2020)"),
            booksListScreen.bookSubtitle(0).hasText("Author Two"),
            booksListScreen.bookTitle(1).hasText("Book One (1918)"),
            booksListScreen.bookSubtitle(1).hasText("Author One"),
            booksListScreen.bookTitle(2).waitForAbsent(),
            screenshoter.screenshot("two_books"),
          ]),
          step("edit book", [
            booksListScreen.bookTitle(0).tap(),
            bookDetailsScreen.title.hasText("Book Two"),
            bookDetailsScreen.year.hasText("2020"),
            bookDetailsScreen.author.hasText("Author Two"),
            screenshoter.screenshot("book_details"),
            bookDetailsScreen.edit.tap(),
            saveBookScreen.dialogTitle.hasText("Редактирование книги"),
            saveBookScreen.cancel.tap(),
            bookDetailsScreen.edit.tap(),
            screenshoter.screenshot("edit_book"),
            saveBookScreen.title.setText("Book Three"),
            saveBookScreen.save.tap(),
            bookDetailsScreen.title.hasText("Book Three"),
            bookDetailsScreen.year.hasText("2020"),
            bookDetailsScreen.author.hasText("Author Two"),
          ]),
          step("remove book", [
            bookDetailsScreen.remove.tap(),
            removeBookScreen.cancel.tap(),
            bookDetailsScreen.remove.tap(),
            removeBookScreen.dialogContent
                .hasText("Book Three (2020), Author Two"),
            screenshoter.screenshot("remove_book"),
            removeBookScreen.remove.tap(),
            booksListScreen.bookTitle(0).hasText("Book One (1918)"),
            booksListScreen.bookSubtitle(0).hasText("Author One"),
            booksListScreen.bookTitle(1).waitForAbsent(),
          ]),
        ]);
      },
      timeout: Timeout(Duration(minutes: 5)),
    );
  });
}
