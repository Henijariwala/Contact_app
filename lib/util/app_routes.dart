import 'package:flutter/cupertino.dart';

import '../screen/home/view/home_screen.dart';
import '../screen/home/view/home_screen_ios.dart';

Map<String , WidgetBuilder> app_routes_android ={
  '/':(context) => const HomeScreen(),
};


Map<String , WidgetBuilder> app_routes_ios ={
  '/':(context) => const HomeScreenIos()
};