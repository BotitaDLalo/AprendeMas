abstract class KeyValueStorageService {
  // Future<void> setKeyValue<T>(String keyToken, T valueToken, String keyId, T valueId, String keyRol, T valueRol);
  Future<void> setKeyValue<T>(String key, T value);
  Future<bool> removeKey(String keyToken,String keyId, String keyRol);
  Future<T?> getValueToken<T>(String keyToken);
  Future<T?> getValueId<T>(String keyId);
  Future<T?> getValueRol<T>(String keyRol);

}
