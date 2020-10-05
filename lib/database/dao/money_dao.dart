import 'package:FinControl/models/contact.dart';
import 'package:FinControl/models/transaction.dart' as t;
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class MoneyDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$type TEXT, '
      '$_valor DOUBLE)';
  static const String _tableName = 'money';
  static const String _id = 'id';
  static const String type = 'name';
  static const String _valor = 'valor';

  Future<int> save(t.Transaction t) async{
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(t);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(t.Transaction m) {
    final Map<String, dynamic> mMap = Map();
    mMap[type] = m.type;
    mMap[_valor] = m.value;
    return mMap;
  }

  Future<List<t.Transaction>> findAll() async {

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<t.Transaction> m = _toList(result);
    return m;
  }

  List<t.Transaction> _toList(List<Map<String, dynamic>> result) {
    final List<t.Transaction> ts = List();
    for (Map<String, dynamic> row in result) {
      final t.Transaction ti = t.Transaction(
        row[_id],
        row[type],
        row[_valor],
      );
      ts.add(ti);
    }
    return ts;
  }

}