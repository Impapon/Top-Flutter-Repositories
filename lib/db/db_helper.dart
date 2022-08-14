import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:top_flutter_repositories_bs23_task/models/repos_model.dart';

class DbHelper {
  static const String createTableItems = '''
  create table $tableItems(
  $tableId integer primary key,
  $tableName text,
  $tableHtmlUrl text,
  $tableFullName text,
  $tableDescription text,
  $tableCreatedAt text,
  $tableUpdatedAt text,
  $tablePushedAt text,
  $tableStargazersCount integer)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'repos.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(createTableItems);
      },
    );
  }

  static Future<int> insertItems(Items items) async {
    final db = await open();
    return db.insert(tableItems, items.toJson());
  }

  static Future<List<Items>> getAllItems() async {
    final db = await open();
    final mapList = await db.query(tableItems, orderBy: '$tableName asc');
    return List.generate(
        mapList.length, (index) => Items.fromJson(mapList[index]));
  }

  static Future<Items> getItemsById(int id) async {
    final db = await open();
    final mapList =
        await db.query(tableItems, where: '$tableId = ?', whereArgs: [id]);
    return Items.fromJson(mapList.first);
  }
}
