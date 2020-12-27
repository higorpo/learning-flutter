import 'package:sqflite/sqflite.dart';
import 'package:bytebank2/models/transference.dart';

import '../app_database.dart';

class TransferenceDao {
  static const String tableSql = 'CREATE TABLE $_tableName ('
      '$_id INTEGER PRIMARY KEY, '
      '$_accountNumber INTEGER, '
      '$_value DOUBLE)';

  static const String _tableName = 'transferences';
  static const String _id = 'id';
  static const String _accountNumber = 'account_number';
  static const String _value = 'value';

  Future<int> save(Transference transference) async {
    final Database db = await getDatabase();

    Map<String, dynamic> transferenceMap = _toMap(transference);

    return db.insert(_tableName, transferenceMap);
  }

  Map<String, dynamic> _toMap(Transference transference) {
    final Map<String, dynamic> transferenceMap = Map();
    transferenceMap[_accountNumber] = transference.accountNumber;
    transferenceMap[_value] = transference.value;
    return transferenceMap;
  }

  Future<List<Transference>> findAll() async {
    final Database db = await getDatabase();

    List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Transference> transferences = _toList(result);

    return transferences;
  }

  List<Transference> _toList(List<Map<String, dynamic>> result) {
    final List<Transference> transferences = List();

    for (Map<String, dynamic> row in result) {
      final Transference transference = Transference(
        row[_id],
        row[_accountNumber],
        row[_value],
      );

      transferences.add(transference);
    }
    return transferences;
  }
}
