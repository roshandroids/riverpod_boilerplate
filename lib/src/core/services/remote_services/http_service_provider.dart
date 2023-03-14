import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';

/// Provider that maps an [HttpService] interface to implementation
final httpServiceProvider = Provider<HttpService>((ref) {
  return HttpServiceImpl();
});
