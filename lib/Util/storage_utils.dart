import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static final box = GetStorage();

  static Future<void> setHistory({
    required String history,
  }) async {
    await box.write(
      'history',
      history,
    );
  }

  static Future<dynamic> getHistory() async {
    return box.read(
      'history',
    );
  }

  static Future<void> deleteToken() async {
    return box.remove(
      'history',
    );
  }

}
