import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: providerR!.contactList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(
                            File("${providerW!.contactList[index].image}")),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("${providerW!.contactList[index].name}",
                                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                              Text("${providerW!.contactList[index].chat}",
                                  style: const TextStyle(fontSize: 15)),
                            ],
                          ),
                          SizedBox(width: 100,),
                          Text("${providerW!.date.day}/${providerW!.date.month}/${providerW!.date.year}",
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          SizedBox(width: 10,),
                          Text("${providerW!.time.hour}:${providerW!.time.minute}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
