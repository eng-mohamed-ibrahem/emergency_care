import 'package:emergency_care/core/service/cache_service/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  CacheService._();
  static final CacheService _instance = CacheService._();
  static CacheService get instance => _instance;

  late SharedPreferences _preferences;

  /// initialize cache service
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// save value method as a general method
  Future<bool> saveData<T>(String key, T data) async {
    switch (data) {
      case (:String data):
        {
          return await _preferences.setString(key, data);
        }
      case (:int data):
        {
          return await _preferences.setInt(key, data);
        }
      case (:bool data):
        {
          return await _preferences.setBool(key, data);
        }
      case (:double data):
        {
          return await _preferences.setDouble(key, data);
        }
      case (:List<String> data):
        {
          return await _preferences.setStringList(key, data);
        }
      default:
        {
          return false;
        }
    }
  }

  /// get data in general way
  dynamic getData(String key) {
    return _preferences.get(key);
  }

  List<String> get contacts =>
      _preferences.getStringList(CacheKeys.contacts) ?? <String>[];

  bool get isRegisterVehicle =>
      _preferences.getBool(CacheKeys.registerVehicle) ?? false;
}
