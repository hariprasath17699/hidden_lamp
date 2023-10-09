import 'package:flutter/material.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List colors = [
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < 7; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 50,
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MATUtils().customText('Trainer', 15, Colors.white),
                      const SizedBox(
                        height: 4,
                      ),
                      MATUtils().customText(
                          'Hey Lucifer, Good morning', 13, Colors.white),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
