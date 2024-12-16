import 'package:aprende_mas/config/services/key_value_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageServiceImpl implements KeyValueStorageService {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  String keyIdName() {
    return 'id';
  }

  @override
  String keyRoleName() {
    return 'role';
  }

  @override
  String keyTokenName() {
    return 'token';
  }

  @override
  Future<bool> removeKey(String keyToken, String keyId, String keyRole) async {
    final prefs = await getSharedPrefs();
    bool removeToken = await prefs.remove(keyToken);
    bool removeId = await prefs.remove(keyId);
    bool removeRol = await prefs.remove(keyRole);
    if (removeToken && removeId && removeRol) {
      return true;
    }
    return false;
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();
    // switch (T) {
    //   case const (int):
    //     prefs.setInt(key, value as int);
    //     break;
    //   case const (String):
    //     prefs.setString(key, value as String);
    //   default:
    //     throw UnimplementedError(
    //         'Set not implemented for type ${T.runtimeType}');
    // }
    if (value is int) {
      prefs.setInt(key, value as int);
    } else if (value is String) {
      prefs.setString(key, value as String);
    } else {
      throw UnimplementedError('Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<T?> getValueId<T>(String keyId) async {
    final prefs = await getSharedPrefs();
    switch (T) {
      case const (int):
        return prefs.getInt(keyId) as T?;
      case const (String):
        return prefs.getString(keyId) as T?;

      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<T?> getValueRole<T>(String keyRole) async {
    final prefs = await getSharedPrefs();
    switch (T) {
      case const (int):
        return prefs.getInt(keyRole) as T?;
      case const (String):
        return prefs.getString(keyRole) as T?;

      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<T?> getValueToken<T>(String keyToken) async {
    final prefs = await getSharedPrefs();
    switch (T) {
      case const (int):
        return prefs.getInt(keyToken) as T?;
      case const (String):
        return prefs.getString(keyToken) as T?;

      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<int> getId() async {
    return await getValueId<int>(keyIdName()) ?? -1;
  }

  @override
  Future<String> getRole() async {
    return await getValueRole<String>(keyRoleName()) ?? "";
  }

  @override
  Future<String> getToken() async {
    return await getValueToken<String>(keyTokenName()) ?? "";
  }
}
