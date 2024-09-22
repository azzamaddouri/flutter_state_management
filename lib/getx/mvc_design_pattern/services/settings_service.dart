import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Create services that are kept in memory throughout the entire app lifecycle
class SettingsService extends GetxService {
  SharedPreferences? sharedPrefs;
  // when I open the app
  Future<SettingsService> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
    return this;
  }
}
