import 'package:sdi_pedidos/core_module/services/database/database_helper.dart';
import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/entities/client.dart';
import 'package:sdi_pedidos/interfaces/services/database/client_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sdi_pedidos/entities/adapters/client_adapter.dart';

class clientDao implements IClient {
  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_cod_cliente INTEGER PRIMARY KEY, '
      '$_nome VARCHAR(200), '
      '$_endereco VARCHAR(200), '
      '$_numero VARCHAR(15), '
      '$_complemento VARCHAR(200), '
      '$_bairro VARCHAR(50), '
      '$_cep VARCHAR(15), '
      '$_cnpj VARCHAR(30), '
      '$_cpf VARCHAR(30), '
      '$_fone VARCHAR(30), '
      '$_email VARCHAR(200)); ';

  static const String _tableName = 'client';
  static const String _cod_cliente = 'cod_cliente';
  static const String _nome = 'nome';
  static const String _endereco = 'endereco';
  static const String _numero = 'numero';
  static const String _complemento = 'complemento';
  static const String _bairro = 'bairro';
  static const String _cep = 'cep';
  static const String _cnpj = 'cnpj';
  static const String _cpf = 'cpf';
  static const String _fone = 'fone';
  static const String _email = 'email';

  Future<Database> getDatabase() async {
    return await DatabaseHelper.instance.database;
  }

  @override
  Future create(List<Client> clients) async {
    await deleteAll();
    final db = await getDatabase();
    await db.transaction((txn) async {
      final batch = txn.batch();
      for (var client in clients) {
        final clientMap = ClientAdapter.toMap(client);
        batch.insert(_tableName, clientMap);
      }
      await batch.commit(noResult: true);
    });
  }

  @override
  Future<List<Client>> getAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Client> produto = ClientAdapter.toList(result);
    return produto;
  }

  @override
  Future<Client?> getOne(IntVO codCliente) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: "codCliente = ?",
      whereArgs: [codCliente.value],
    );

//returning the first client because it should only have one
    if (results.isNotEmpty) {
      return ClientAdapter.fromMap(results.first);
    } else {
      return null;
    }
  }

  @override
  Future delete(IntVO codCliente) async {
    final Database db = await getDatabase();
    return db
        .delete(_tableName, where: '$_cod_cliente: ?', whereArgs: [codCliente]);
  }

  @override
  Future deleteAll() async {
    final Database db = await getDatabase();
    final result = await db.delete(_tableName);
    return result;
  }

  @override
  Future update(Client client) async {
    final Database db = await getDatabase();
    Map<String, dynamic> produtoMap = ClientAdapter.toMap(client);
    return db.update(_tableName, produtoMap,
        where: '$_cod_cliente = ?', whereArgs: [client.codCliente]);
  }
}
