import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      final StorageService initializedStorageService = StorageServiceImpl();
      await initializedStorageService.init();
      runApp(
        ProviderScope(
          overrides: [
            localStorageProvider.overrideWithValue(initializedStorageService),
          ],
          child: const MyApp(),
        ),
      );
    },
    // ignore: only_throw_errors
    (error, stack) => throw error,
  );
}
