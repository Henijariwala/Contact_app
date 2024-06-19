import 'dart:io';

import 'package:contact_app_flutter/screen/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../profile/model/contact_model.dart';
import '../provider/setting_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingProvider? providerW;
  SettingProvider? providerR;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    GlobalKey<FormState> formKey = GlobalKey();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        providerR!.changeProfile();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new))
                ],
              ),
            ),
            Visibility(
                visible: providerW!.isProfile,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage:
                              FileImage(File("${providerW!.selectedImage}")),
                          radius: 70,
                          child: Align(
                            alignment: const Alignment(0.9, 0.9),
                            child: IconButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? image =
                                    await picker.pickImage(source: ImageSource.gallery);

                                providerR!.changeImage(image!.path);
                              },
                              icon: const Icon(Icons.camera_enhance_rounded),
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: txtName,
                        decoration: const InputDecoration(
                          hintText: "Enter your name...",
                          label: Text("Enter name"),
                          border: OutlineInputBorder()
                        ),
                      ),
                      TextFormField(
                        controller: txtBio,
                        decoration: const InputDecoration(
                          hintText: "Enter you Bio..",
                          label: Text("Enter bio"),
                          border: OutlineInputBorder()
                        ),
                      ),
                      Center(
                        child: TextButton(onPressed: () {
                          if(formKey.currentState!.validate()) {
                            ContactModel c2 = ContactModel(
                              name: txtName.text,
                              chat: txtBio.text,
                            );
                            context.read<HomeProvider>().addContact(c2);

                          }
                        }, child: Text("Save",style: TextStyle(
                          fontSize: 20
                        ),)),
                      ),
                    ],
                  ),
                )
            ),
            //Theme
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Theme",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  Spacer(),
                  Switch(value: providerW!.theme, onChanged: (value) {
                    context.read<SettingProvider>().setTheme();
                  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
