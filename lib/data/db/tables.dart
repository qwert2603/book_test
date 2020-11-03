import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'tables.g.dart';

class BookTable extends Table {
  TextColumn get uuid => text()();

  TextColumn get author => text()();

  TextColumn get title => text()();

  IntColumn get year => integer()();

  @override
  Set<Column> get primaryKey => {uuid};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [BookTable])
class BooksDatabase extends _$BooksDatabase {
  BooksDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<BookTableData>> books() => select(bookTable).watch();

  Future<void> saveBook(BookTableData bookTableData) => transaction(() async {
        await into(bookTable)
            .insert(bookTableData, mode: InsertMode.insertOrReplace);
      });

  Future<void> deleteBook(String uuid) => transaction(() async {
        await (delete(bookTable)..where((tbl) => tbl.uuid.equals(uuid))).go();
      });
}
