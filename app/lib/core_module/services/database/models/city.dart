import 'package:sdi_pedidos/core_module/services/database/database_helper.dart';
import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/entities/city.dart';
import 'package:sdi_pedidos/interfaces/services/database/city_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sdi_pedidos/entities/adapters/city_adapter.dart';

class city implements ICity {
  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_cod_cidade INTEGER PRIMARY KEY, '
      '$_nome VARCHAR(30), '
      '$_uf VARCHAR(2), '
      '$_cod_regiao VARCHAR(5), '
      '$_cod_nacional VARCHAR(15), '
      '$_cep VARCHAR(10)); ';

  static const String _tableName = 'city';
  static const String _cod_cidade = 'cod_cidade';
  static const String _nome = 'nome';
  static const String _uf = 'uf';
  static const String _cod_regiao = 'cod_regiao';
  static const String _cod_nacional = 'cod_nacional';
  static const String _cep = 'cep';

  Future<Database> getDatabase() async {
    return await DatabaseHelper.instance.database;
  }

  // @override
  // Future create(List<Client> clients) async {
  //   await deleteAll();
  //   final db = await getDatabase();
  //   final resultCreated = await db.transaction((txn) async {
  //     final batch = txn.batch();
  //     for (var client in clients) {
  //       final clientMap = ClientAdapter.toMap(client);
  //       batch.insert(_tableName, clientMap);
  //     }
  //     await batch.commit();
  //   });
  //   return resultCreated;
  // }
  @override
  Future<bool> create(List<City> cities) async {
    await deleteAll();
    final db = await getDatabase();
    bool allSuccessful = true;

    final results = await db.transaction((txn) async {
      final batch = txn.batch();
      for (var city in cities) {
        final cityMap = CityAdapter.toMap(city);
        batch.insert(_tableName, cityMap);
      }
      return await batch.commit();
    });

    for (var result in results) {
      if (result == null || result is! int) {
        allSuccessful = false;
        break;
      }
    }

    return allSuccessful;
  }

  @override
  Future<List<City>> getAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<City> produto = CityAdapter.toList(result);
    return produto;
  }

  @override
  Future<City?> getOne(IntVO codCidade) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: "$_cod_cidade = ?",
      whereArgs: [codCidade.value],
    );

//returning the first city because it should only have one
    if (results.isNotEmpty) {
      return CityAdapter.fromMap(results.first);
    } else {
      return null;
    }
  }

  @override
  Future delete(IntVO codCidade) async {
    final Database db = await getDatabase();
    return db
        .delete(_tableName, where: '$_cod_cidade: ?', whereArgs: [codCidade]);
  }

  @override
  Future deleteAll() async {
    final Database db = await getDatabase();
    final result = await db.delete(_tableName);
    return result;
  }

  @override
  Future update(City city) async {
    final Database db = await getDatabase();
    Map<String, dynamic> produtoMap = CityAdapter.toMap(city);
    return db.update(_tableName, produtoMap,
        where: '$_cod_cidade = ?', whereArgs: [city.codCidade]);
  }
}
