import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/provider/home_provider.dart';

class CallScreenIos extends StatefulWidget {
  const CallScreenIos({super.key});

  @override
  State<CallScreenIos> createState() => _CallScreenIosState();
}

class _CallScreenIosState extends State<CallScreenIos> {
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
            itemBuilder: (context, index) => Column(children: [
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
                        Placeholder(
                          fallbackHeight: 30,
                          fallbackWidth: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${providerW!.contactList[index].name}",
                                style:
                                const TextStyle(fontSize: 20)),
                            Text(
                                "${providerW!.contactList[index].chat}",
                                style:
                                const TextStyle(fontSize: 15)),
                          ],
                        ),
                        Spacer(),
                        CupertinoButton(child: Icon(CupertinoIcons.phone),
                          onPressed: () async {
                            Uri uri = Uri.parse ('tel:-${providerR!.selectedContact!.phone}');
                            await launchUrl(uri);
                          },)
                      ],
                    ),
                  ],
                ),
              )
            ])));
  }
}
