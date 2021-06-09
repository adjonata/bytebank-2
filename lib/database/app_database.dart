import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(
    path,
    onCreate: (database, version) {
      database.execute(ContactDao.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}