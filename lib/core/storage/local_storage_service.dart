import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_scan/core/storage/storage_keys.dart';

class LocalStorageService {
  LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }
  late SharedPreferences _prefInstance;

  static final LocalStorageService _instance = LocalStorageService._internal();

  Future<void> initPrefInstance() async {
    _prefInstance = await SharedPreferences.getInstance();
  }

  Future<void> setFetchedData(String data) async {
    await _prefInstance.setString(StorageKeys.DATA, data);
  }

  String? get getFetchedData {
    return _prefInstance.getString(StorageKeys.DATA) ?? '';
  }
}
