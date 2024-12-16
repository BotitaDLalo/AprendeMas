abstract class KeyValueStorageService {
  // Future<void> setKeyValue<T>(String keyToken, T valueToken, String keyId, T valueId, String keyRol, T valueRol);
  String keyIdName();
  String keyTokenName();
  String keyRoleName();
  Future<void> setKeyValue<T>(String key, T value);
  Future<bool> removeKey(String keyToken, String keyId, String keyRole);
  Future<T?> getValueId<T>(String keyId);
  Future<T?> getValueRole<T>(String keyRole);
  Future<T?> getValueToken<T>(String keyToken);
  Future<int> getId();
  Future<String> getRole();
  Future<String> getToken();
}
