import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Initialize variable not business logic
class SettingsService extends GetxService {
  SharedPreferences? sharedPrefs;
  // when I open the app
  Future<SettingsService> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
    return this;
  }
}
