abstract class IStorage {
  Future<Map<String, String>> readAll();
  Future<void> save(key, value);
  Future<String?> read(String key);
  Future<void> remove(key);
  Future<void> removeAll();
}
