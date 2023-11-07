import 'package:api_servis_http/data/local/local_database/database_helper.dart';
import 'package:api_servis_http/services/api_service.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final GetIt _locator = GetIt.instance;

  static void setup() {
    _locator.registerLazySingleton(() => DBHelper.instance);
    _locator.registerLazySingleton(() => ApiService());
  }

  // static T get<T>() => _locator.get<T>();
}
