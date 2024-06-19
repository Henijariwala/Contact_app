import 'package:contact_app_flutter/screen/call/view/call_screen.dart';
import 'package:contact_app_flutter/screen/chat/view/chat_screen.dart';
import 'package:contact_app_flutter/screen/profile/view/profile_screen.dart';
import 'package:contact_app_flutter/screen/setting/provider/setting_provider.dart';
import 'package:contact_app_flutter/screen/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SettingProvider? providerW;
  SettingProvider? providerR;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();

    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
          appBar: AppBar(
          title: const Text("Android"),
      actions: [
      Switch(
             value: providerW!.isIos,
             onChanged: (value) {
               providerR!.platFrom();
            },
          ),
      ],
            bottom: const TabBar(
              tabs: [
                Icon(Icons.person_add_alt_1),
                Text("Chat"),
                Text("Call"),
                Text("Setting"),
              ],
            ),
      ),
      body: const TabBarView(
        children: [
          ProfileScreen(),
          ChatScreen(),
          CallScreen(),
          SettingScreen()
        ],
      )
      ),
    );
  }
}
