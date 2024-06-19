import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class ChatScreenIos extends StatefulWidget {
  const ChatScreenIos({super.key});

  @override
  State<ChatScreenIos> createState() => _ChatScreenIosState();
}

class _ChatScreenIosState extends State<ChatScreenIos> {
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
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'iosdetail',
                        arguments: index);
                  },
                  child: Container(
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
                          ],
                        ),
                      ],
                    ),
                  )),
            ])));
  }
}
