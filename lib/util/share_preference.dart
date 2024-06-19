import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {

  void setThemeName({required bool isTheme}) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("theme", isTheme);
  }

  Future<bool?> getThemeName() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getBool("theme");
  }
}