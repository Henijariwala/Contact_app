import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../home/provider/home_provider.dart';
import '../model/contact_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(File(providerW!.path)),
                  backgroundColor: Colors.grey,
                ),
                Align(
                  alignment: const Alignment(0.3, 0.4),
                  child: IconButton(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      providerR!.addPath(image!.path);
                    },
                    icon: const Icon(Icons.camera_enhance_rounded),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                  ),
                ),
              ],
            ),
            const Text(
              "Name :-",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: txtName,
              decoration: const InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleLarge,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter the detail";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            const Text(
              "Chat :-",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: txtChat,
              decoration: const InputDecoration(
                hintText: "Enter your chat",
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleLarge,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter the detail";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            const Text(
              "Mobile Number :-",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: txtPhone,
              decoration: const InputDecoration(
                hintText: "Enter your Number",
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleLarge,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter the detail";
                } else if (value.length != 10) {
                  return "Enter the valid number";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(onPressed: () async{
              DateTime? d1 =await showDatePicker(context: context, firstDate: DateTime(2001), lastDate: DateTime(2030));
              providerW!.dateChange(d1!);
            },
              label: Text("${providerW!.date.day}/${providerW!.date.month}/${providerW!.date.year}"),
              icon: const Icon(Icons.calendar_month),),
            TextButton.icon(onPressed: () async {
              TimeOfDay? time=await showTimePicker(context: context, initialTime: TimeOfDay.now());
              providerW!.changeTime(time!);
            }, label: Text("${providerW!.time.hour}:${providerW!.time.minute}"), icon: const Icon(Icons.lock_clock),),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    ContactModel c1 = ContactModel(
                      image:  providerR!.path,
                        name: txtName.text,
                        phone: txtPhone.text,
                        chat: txtChat.text);

                    context.read<HomeProvider>().addContact(c1);
                    providerW!.path = "";
                    txtName.clear();
                    txtPhone.clear();
                    txtChat.clear();

                  },
                  child: const Text("Submit")),
            ),
          ],
        ),
      ),
    );
  }
}
