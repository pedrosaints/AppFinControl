import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dao/contact_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'fincontrol_months.db');
  return openDatabase(path,
    onCreate: (db, version) {
      db.execute(MonthDao.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

