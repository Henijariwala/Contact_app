import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../home/provider/home_provider.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
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
                          SizedBox(width: 200,),
                          IconButton(onPressed: () async{
                            Uri uri = Uri.parse ('tel:-${providerR!.selectedContact!.phone}');
                            await launchUrl(uri);
                          }, icon: const Icon(Icons.phone)),
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
