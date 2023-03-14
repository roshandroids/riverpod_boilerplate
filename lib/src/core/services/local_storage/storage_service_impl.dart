import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';

/// [StorageServiceImpl] interface implementation using the Isar package
///
/// See: https://isar.dev/
class StorageServiceImpl implements StorageService {
  ///  An instance of the Isar Database.
  late Isar isarDb;

  /// Opens a Hive box by its name
  Future<void> _openBox() async {
    final dir = await getApplicationDocumentsDirectory();
    isarDb = await Isar.open([], directory: dir.path);
  }

  @override
  Future<void> init() async {
    await _openBox();
  }

  @override
  Future<void> insert() {
    // TODO: implement insert
    throw UnimplementedError();
  }
}
