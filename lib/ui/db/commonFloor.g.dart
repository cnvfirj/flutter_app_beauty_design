// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commonFloor.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMainDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MainDatabaseBuilder databaseBuilder(String name) =>
      _$MainDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MainDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MainDatabaseBuilder(null);
}

class _$MainDatabaseBuilder {
  _$MainDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MainDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MainDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MainDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MainDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MainDatabase extends MainDatabase {
  _$MainDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NumberDao? _numberDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ex` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `number` INTEGER NOT NULL, `source` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `hist` (`from` INTEGER NOT NULL, `to` INTEGER NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `number` INTEGER NOT NULL, `source` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NumberDao get numberDao {
    return _numberDaoInstance ??= _$NumberDao(database, changeListener);
  }
}

class _$NumberDao extends NumberDao {
  _$NumberDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _exEntityInsertionAdapter = InsertionAdapter(
            database,
            'ex',
            (ExEntity item) => <String, Object?>{
                  'id': item.id,
                  'number': item.number,
                  'source': item.source
                }),
        _histEntityInsertionAdapter = InsertionAdapter(
            database,
            'hist',
            (HistEntity item) => <String, Object?>{
                  'from': item.from,
                  'to': item.to,
                  'id': item.id,
                  'number': item.number,
                  'source': item.source
                }),
        _exEntityDeletionAdapter = DeletionAdapter(
            database,
            'ex',
            ['id'],
            (ExEntity item) => <String, Object?>{
                  'id': item.id,
                  'number': item.number,
                  'source': item.source
                }),
        _histEntityDeletionAdapter = DeletionAdapter(
            database,
            'hist',
            ['id'],
            (HistEntity item) => <String, Object?>{
                  'from': item.from,
                  'to': item.to,
                  'id': item.id,
                  'number': item.number,
                  'source': item.source
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExEntity> _exEntityInsertionAdapter;

  final InsertionAdapter<HistEntity> _histEntityInsertionAdapter;

  final DeletionAdapter<ExEntity> _exEntityDeletionAdapter;

  final DeletionAdapter<HistEntity> _histEntityDeletionAdapter;

  @override
  Future<List<ExEntity>> allNumbersEx() async {
    return _queryAdapter.queryList('SELECT * FROM ex',
        mapper: (Map<String, Object?> row) => ExEntity(
            number: row['number'] as int, source: row['source'] as String));
  }

  @override
  Future<List<HistEntity>> allNumbersHist() async {
    return _queryAdapter.queryList('SELECT * FROM hist',
        mapper: (Map<String, Object?> row) => HistEntity(
            number: row['number'] as int,
            source: row['source'] as String,
            from: row['from'] as int,
            to: row['to'] as int));
  }

  @override
  Future<List<int>> valuesEx() async {
    return await _queryAdapter.queryList('SELECT number FROM ex',
        mapper: (Map<String, Object?>row)=>row['number']as int);
  }

  @override
  Future<ExEntity?> findExEntityToNumber(int number) async {
    return _queryAdapter.query('SELECT * FROM ex WHERE number = ?1',
        mapper: (Map<String, Object?> row) => ExEntity(
            number: row['number'] as int, source: row['source'] as String),
        arguments: [number]);
  }

  @override
  Future<int> insertEx(ExEntity entity) {
    return _exEntityInsertionAdapter.insertAndReturnId(
        entity, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertHist(HistEntity entity) {
    return _histEntityInsertionAdapter.insertAndReturnId(
        entity, OnConflictStrategy.abort);
  }

  @override
  Future<void> allDeleteEx(List<ExEntity> list) async {
    await _exEntityDeletionAdapter.deleteList(list);
  }

  @override
  Future<void> allDeleteHist(List<HistEntity> list) async {
    await _histEntityDeletionAdapter.deleteList(list);
  }

  @override
  Future<void> deleteEx(ExEntity entity) async {
    await _exEntityDeletionAdapter.delete(entity);
  }

  @override
  Future<void> deleteHist(HistEntity entity) async {
    await _histEntityDeletionAdapter.delete(entity);
  }
}
