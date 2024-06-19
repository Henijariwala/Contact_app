import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
import '../model/contact_model.dart';

class ProfileScreenIos extends StatefulWidget {
  const ProfileScreenIos({super.key});

  @override
  State<ProfileScreenIos> createState() => _ProfileScreenIosState();
}

class _ProfileScreenIosState extends State<ProfileScreenIos> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    GlobalKey <FormState> formKey = GlobalKey();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
              ),
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: MediaQuery.sizeOf(context)!.width,
              ),
              const SizedBox(height: 15,),
              const Text("Name :-"),
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
              const Text("Phone :-"),
              CupertinoTextFormFieldRow(
                placeholder: 'Enter the Number',
                textInputAction: TextInputAction.next,
                controller: txtPhone,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: CupertinoColors.black),
                    bottom: BorderSide(color: CupertinoColors.black),
                    right: BorderSide(color: CupertinoColors.black),
                    left: BorderSide(color: CupertinoColors.black),
                  )
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 10) {
                    return 'Please enter a valid number.';
                  }
                  return null;
                },
              ),
              const Text("Chat :-"),
              CupertinoTextFormFieldRow(
                placeholder: 'Enter the chat',
                textInputAction: TextInputAction.next,
                controller: txtChat,
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
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(context: context, builder: (context) {
                    return Container(
                      height: 250,
                      color: CupertinoColors.white,
                      child: CupertinoDatePicker(onDateTimeChanged: (value) {
                        providerW!.dateChange(value);
                      },
                        mode: CupertinoDatePickerMode.date,
                        minimumYear: 2001,
                      ),
                    );
                  },);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.calendar),
                    const SizedBox(width: 10,),
                    Text("${providerW!.date.day}/${providerW!.date.month}/${providerW!.date.year}")
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 250,
                        color: CupertinoColors.white,
                        child: CupertinoDatePicker(onDateTimeChanged: (value) {
                          TimeOfDay t1 = TimeOfDay(hour: value.hour, minute: value.minute);
                          providerW!.changeTime(t1);
                        },),
                      );
                    },);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.clock),
                    const SizedBox(width: 10,),
                    Text("${providerW!.time.hour}/${providerW!.time.minute}")
                  ],
                ),
              ),
              Center(
                child: CupertinoButton.filled(child: const Text("Submit"), onPressed: () {
                  if(formKey.currentState!.validate())
                  {
                    ContactModel c1 = ContactModel
                      (
                        name: txtName.text,
                        phone: txtPhone.text,
                        chat: txtChat.text);

                    context.read<HomeProvider>().addContact(c1);
                    txtName.clear();
                    txtPhone.clear();
                    txtChat.clear();
                  }
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
