abstract class KeyValueStorageService {
  Future<void> setKeyValue<T>(String key, T value);
  Future<bool> removeKeyValue(String keyToken, String keyId, String keyRole, String keyUserName);

  Future<T?> getValue<T>(String key);

  Future<int> getId();
  Future<String> getRole();
  Future<String> getToken();
  Future<String> getUserName();
  Future<String> getAuthType();
}
