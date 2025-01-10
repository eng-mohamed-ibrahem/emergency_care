import 'package:emergency_care/core/service/cache_service/cache_service.dart';
import 'package:get_it/get_it.dart';

GetIt _getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  _getIt.registerSingleton<CacheService>(CacheService.instance);
  await CacheService.instance.init();
}
