import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
import '../../profile/model/contact_model.dart';
import '../provider/setting_provider.dart';

class SettingScreenIos extends StatefulWidget {
  const SettingScreenIos({super.key});

  @override
  State<SettingScreenIos> createState() => _SettingScreenIosState();
}

class _SettingScreenIosState extends State<SettingScreenIos> {
  SettingProvider? providerW;
  SettingProvider? providerR;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    GlobalKey<FormState> formKey = GlobalKey();
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Row(
            children: [
              const Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              const Spacer(),
              CupertinoButton(
                  onPressed: () {
                    providerR!.changeProfile();
                  },
                  child: const Icon(CupertinoIcons.arrow_right)),
            ],
          ),
        ),
        Visibility(
          visible: providerW!.isProfile,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                ),
                const SizedBox(height: 10),
                const Text("Enter your Name :-"),
                CupertinoTextFormFieldRow(
                  placeholder: 'Enter the name',
                  controller: txtName,
                  textInputAction: TextInputAction.next,
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: CupertinoColors.black),
                        bottom: BorderSide(color: CupertinoColors.black),
                        right: BorderSide(color: CupertinoColors.black),
                        left: BorderSide(color: CupertinoColors.black),
                      )
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
                const Text("Enter your Bio :-"),
                CupertinoTextFormFieldRow(
                  placeholder: 'Enter the bio',
                  controller: txtBio,
                  textInputAction: TextInputAction.next,
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: CupertinoColors.black),
                        bottom: BorderSide(color: CupertinoColors.black),
                        right: BorderSide(color: CupertinoColors.black),
                        left: BorderSide(color: CupertinoColors.black),
                      )
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
                Center(
                  child: CupertinoButton(child: Text("Save",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      onPressed: () {
                               if(formKey.currentState!.validate()) {
                                 ContactModel c2 = ContactModel(
                                   name: txtName.text,
                                   chat: txtBio.text,
                                 );
                                 context.read<HomeProvider>().addContact(c2);
                               }
                      },),
                )
              ],
            )
        ),
        Row(
          children: [
            const Text("Theme",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
            const Spacer(),
            CupertinoSwitch(value: providerW!.theme, onChanged: (value) {
              context.read<SettingProvider>().setTheme();
            },),
          ],
        ),
      ],
    );
  }
}
