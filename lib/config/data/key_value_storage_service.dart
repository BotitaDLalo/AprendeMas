abstract class KeyValueStorageService {
  // Future<void> setKeyValue<T>(String keyToken, T valueToken, String keyId, T valueId, String keyRol, T valueRol);
  String keyIdName();
  String keyTokenName();
  String keyRoleName();
  String keyUserName();

  Future<void> setKeyValue<T>(String key, T value);
  Future<bool> removeKey(String keyToken, String keyId, String keyRole, String keyUserName);
  
  Future<T?> getValueId<T>(String keyId);
  Future<T?> getValueRole<T>(String keyRole);
  Future<T?> getValueToken<T>(String keyToken);
  Future<T?> getValueUserName<T>(String keyUserName);

  Future<int> getId();
  Future<String> getRole();
  Future<String> getToken();
  Future<String> getUserName();
}
