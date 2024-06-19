import 'package:flutter/cupertino.dart';

import '../../../util/share_preference.dart';

class SettingProvider with ChangeNotifier {
  bool theme = false;
  bool isIos = false;
  bool isProfile = false;
  String? selectedImage;

  void changeImage(String? path)
  {
    selectedImage = path;
    notifyListeners();
  }
  void platFrom()
  {
    isIos = !isIos;
    notifyListeners();
  }

  void setTheme() {
    theme = !theme;
    SharedHelper share = SharedHelper();
    share.setThemeName(isTheme: theme);
    getTheme();
  }

  void getTheme() async {
    SharedHelper share = SharedHelper();
    theme = (await share.getThemeName())!;
    notifyListeners();
  }

  void changeProfile() {
    isProfile = !isProfile;
    notifyListeners();
  }
}
