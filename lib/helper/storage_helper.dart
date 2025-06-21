import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  StorageHelper._();
  static final StorageHelper instance = StorageHelper._();
  factory StorageHelper() => instance;

  late SharedPreferences sp;

  init() async {
    sp = await SharedPreferences.getInstance();
  }

  void clear() async {
    await sp.clear();
    print("Storage cleared");
  }

  void setToken(String token) {
    sp.setString("token", token);
  }

  String getToken() {
    return sp.getString("token") ?? "";
  }
}
