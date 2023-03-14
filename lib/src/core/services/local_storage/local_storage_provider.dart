import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';

/// Provider that locates an [StorageService] interface to implementation
final localStorageProvider = Provider<StorageService>(
  (ref) => StorageServiceImpl(),
);
