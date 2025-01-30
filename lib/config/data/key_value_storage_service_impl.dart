import 'package:aprende_mas/config/data/key_value_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';

class KeyValueStorageServiceImpl implements KeyValueStorageService {
  final cn = CatalogNames();

  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> removeKeyValue(
      String keyToken, String keyId, String keyRole, String keyUserName) async {
    final prefs = await getSharedPrefs();
    bool removeToken = await prefs.remove(keyToken);
    bool removeId = await prefs.remove(keyId);
    bool removeRol = await prefs.remove(keyRole);
    bool removeUserName = await prefs.remove(keyUserName);
    if (removeToken && removeId && removeRol && removeUserName) {
      return true;
    }
    return false;
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();
    if (value is int) {
      await prefs.setInt(key, value as int);
    } else if (value is String) {
      await prefs.setString(key, value as String);
    } else if (value is Enum) {
      await prefs.setString(key, value.toString());
    } else {
      throw UnimplementedError('Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();
    switch (T) {
      case const (int):
        return prefs.getInt(key) as T?;
      case const (String):
        return prefs.getString(key) as T?;

      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<int> getId() async {
    return await getValue<int>(cn.getKeyIdName) ?? -1;
  }

  @override
  Future<String> getRole() async {
    return await getValue<String>(cn.getKeyRoleName) ?? "";
  }

  @override
  Future<String> getToken() async {
    return await getValue<String>(cn.getKeyTokenName) ?? "";
  }

  @override
  Future<String> getUserName() async {
    return await getValue<String>(cn.getKeyUserName) ?? "";
  }

  @override
  Future<String> getAuthType() async {
    return await getValue<String>(cn.getKeyAuthTypeName) ?? "";
  }
}