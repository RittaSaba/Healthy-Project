import 'package:get_storage/get_storage.dart';

class UserStorage {
  final storage = GetStorage();

  Future<void> save(String key, String value) async {
    await storage.write(key, value);
  }

  Future<String?> read(String key) async {
    return await storage.read(key);
  }
  Future<void> delete(String key) async {
    return await storage.write(key,'');
  }
}
