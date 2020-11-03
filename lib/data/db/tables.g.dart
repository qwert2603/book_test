// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BookTableData extends DataClass implements Insertable<BookTableData> {
  final String uuid;
  final String author;
  final String title;
  final int year;
  BookTableData(
      {@required this.uuid,
      @required this.author,
      @required this.title,
      @required this.year});
  factory BookTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return BookTableData(
      uuid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      year: intType.mapFromDatabaseResponse(data['${effectivePrefix}year']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    return map;
  }

  BookTableCompanion toCompanion(bool nullToAbsent) {
    return BookTableCompanion(
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
    );
  }

  factory BookTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BookTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      author: serializer.fromJson<String>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      year: serializer.fromJson<int>(json['year']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'author': serializer.toJson<String>(author),
      'title': serializer.toJson<String>(title),
      'year': serializer.toJson<int>(year),
    };
  }

  BookTableData copyWith(
          {String uuid, String author, String title, int year}) =>
      BookTableData(
        uuid: uuid ?? this.uuid,
        author: author ?? this.author,
        title: title ?? this.title,
        year: year ?? this.year,
      );
  @override
  String toString() {
    return (StringBuffer('BookTableData(')
          ..write('uuid: $uuid, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('year: $year')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(uuid.hashCode,
      $mrjc(author.hashCode, $mrjc(title.hashCode, year.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BookTableData &&
          other.uuid == this.uuid &&
          other.author == this.author &&
          other.title == this.title &&
          other.year == this.year);
}

class BookTableCompanion extends UpdateCompanion<BookTableData> {
  final Value<String> uuid;
  final Value<String> author;
  final Value<String> title;
  final Value<int> year;
  const BookTableCompanion({
    this.uuid = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.year = const Value.absent(),
  });
  BookTableCompanion.insert({
    @required String uuid,
    @required String author,
    @required String title,
    @required int year,
  })  : uuid = Value(uuid),
        author = Value(author),
        title = Value(title),
        year = Value(year);
  static Insertable<BookTableData> custom({
    Expression<String> uuid,
    Expression<String> author,
    Expression<String> title,
    Expression<int> year,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (year != null) 'year': year,
    });
  }

  BookTableCompanion copyWith(
      {Value<String> uuid,
      Value<String> author,
      Value<String> title,
      Value<int> year}) {
    return BookTableCompanion(
      uuid: uuid ?? this.uuid,
      author: author ?? this.author,
      title: title ?? this.title,
      year: year ?? this.year,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('year: $year')
          ..write(')'))
        .toString();
  }
}

class $BookTableTable extends BookTable
    with TableInfo<$BookTableTable, BookTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BookTableTable(this._db, [this._alias]);
  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  GeneratedTextColumn _uuid;
  @override
  GeneratedTextColumn get uuid => _uuid ??= _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn(
      'uuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  @override
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn(
      'author',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  GeneratedIntColumn _year;
  @override
  GeneratedIntColumn get year => _year ??= _constructYear();
  GeneratedIntColumn _constructYear() {
    return GeneratedIntColumn(
      'year',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [uuid, author, title, year];
  @override
  $BookTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'book_table';
  @override
  final String actualTableName = 'book_table';
  @override
  VerificationContext validateIntegrity(Insertable<BookTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid'], _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author'], _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year'], _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BookTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BookTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BookTableTable createAlias(String alias) {
    return $BookTableTable(_db, alias);
  }
}

abstract class _$BooksDatabase extends GeneratedDatabase {
  _$BooksDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BookTableTable _bookTable;
  $BookTableTable get bookTable => _bookTable ??= $BookTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bookTable];
}
