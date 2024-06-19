import 'package:contact_app_flutter/screen/call/view/call_screen_ios.dart';
import 'package:contact_app_flutter/screen/profile/view/profile_screen_ios.dart';
import 'package:contact_app_flutter/screen/setting/provider/setting_provider.dart';
import 'package:contact_app_flutter/screen/setting/view/setting_screen_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../chat/view/chat_screen_ios.dart';
import '../provider/home_provider.dart';
class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({super.key});

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
  SettingProvider? providerW;
  SettingProvider? providerR;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Ios"),
        trailing: CupertinoSwitch(
          value: providerW!.isIos,
          onChanged: (value) {
            providerR!.platFrom();
          },
        ),
      ),
      child: Center(
        child: CupertinoTabScaffold(

          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
          ]),
          tabBuilder: (context, index) {
            return index == 0
                ? const ProfileScreenIos()
                : index == 1
                ? const ChatScreenIos()
                : index == 2
                ? const CallScreenIos()
                : const SettingScreenIos();
          },
        ),
      ),
    );
  }
}
