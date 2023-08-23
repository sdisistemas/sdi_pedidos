import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';

class Storage implements IStorage {
  final FlutterSecureStorage storage;

  Storage() : storage = FlutterSecureStorage();

  @override
  Future<String?> read(String key) async {
    String? value = await storage.read(key: key);

    return value;
  }

  @override
  Future<Map<String, String>> readAll() async {
    Map<String, String> allValues = await storage.readAll();

    return allValues;
  }

  @override
  Future<void> remove(key) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> removeAll() async {
    await storage.deleteAll();
  }

  @override
  Future<void> save(key, value) async {
    await storage.write(key: key, value: value);
  }
}
