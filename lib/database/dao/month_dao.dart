import 'package:FinControl/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class MonthDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_salario DOUBLE)';
  static const String _tableName = 'months';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _salario = 'salario';

  Future<int> save(Month contact) async{
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Month m) {
    final Map<String, dynamic> mMap = Map();
    mMap[_name] = m.name;
    mMap[_salario] = m.salario;
    return mMap;
  }

  Future<List<Month>> findAll() async {

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Month> m = _toList(result);
    return m;
  }

  List<Month> _toList(List<Map<String, dynamic>> result) {
    final List<Month> months = List();
    for (Map<String, dynamic> row in result) {
      final Month m = Month(
        row[_id],
        row[_name],
        row[_salario],
      );
      months.add(m);
    }
    return months;
  }

}