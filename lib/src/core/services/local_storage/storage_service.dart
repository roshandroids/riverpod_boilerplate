/// Local Storage service interface
abstract class StorageService {
  /// Initializes service
  Future<void> init();

  /// Insert
  Future<void> insert();
}
