import 'package:contact_app_flutter/screen/home/provider/home_provider.dart';
import 'package:contact_app_flutter/screen/setting/provider/setting_provider.dart';
import 'package:contact_app_flutter/util/app_routes.dart';
import 'package:contact_app_flutter/util/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: HomeProvider()),
          ChangeNotifierProvider.value(value: SettingProvider()..getTheme()),
        ],
        child: Consumer<SettingProvider>(
          builder: (context, value, child) => value.isIos == false
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: value.theme
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  routes: app_routes_android,
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  routes: app_routes_ios,
            theme: value.theme
            ? light
            : dark,
                ),
        )),
  );
}
