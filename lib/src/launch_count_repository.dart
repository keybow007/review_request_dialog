import 'package:shared_preferences/shared_preferences.dart';

class LaunchCountRepository {
  static const String keyLaunchCount = "launch_count";
  static const String keyNoMoreDisplay = "no_more_display";

  static Future<int> getLaunchCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyLaunchCount) ?? 0;
  }

  static Future<int> setLaunchCount(int launchCount) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyLaunchCount, launchCount);
    return getLaunchCount();
  }

  static Future<bool> isNoMoreDisplay() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyNoMoreDisplay) ?? false;
  }

  static Future<void> setNoMoreDisplay() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyNoMoreDisplay, true);
  }

}