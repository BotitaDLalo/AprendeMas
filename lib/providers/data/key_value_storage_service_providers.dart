import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/data/key_value_storage_service_impl.dart';

final storageServiceProvider = Provider<KeyValueStorageServiceImpl>((ref) {
  return KeyValueStorageServiceImpl();
});

final idFutureProvider = FutureProvider.autoDispose<int>(
  (ref) async {
    final storageService = ref.watch(storageServiceProvider);
    return await storageService.getId();
  },
);

final roleFutureProvider = FutureProvider.autoDispose<String>(
  (ref) async {
    final storageService = ref.watch(storageServiceProvider);
    return await storageService.getRole();
  },
);

final tokenFutureProvider = FutureProvider.autoDispose<String>(
  (ref) async {
    final storageService = ref.watch(storageServiceProvider);
    return await storageService.getToken();
  },
);

final userNameFutureProvider = FutureProvider.autoDispose<String>(
  (ref) async {
    final storageService = ref.watch(storageServiceProvider);
    return await storageService.getUserName();
  },
);

final authTypeFutureProvider = FutureProvider.autoDispose<String>(
  (ref) async {
    final storageService = ref.watch(storageServiceProvider);
    return await storageService.getAuthType();
  },
);

final emailFutureProvider = FutureProvider.autoDispose<String>(
  (ref) async {
    final storageService = ref.watch(storageServiceProvider);
    return await storageService.getEmail();
  },
);
