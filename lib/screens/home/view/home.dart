import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hidden_lamp/screens/HelpCenter/view/HelpCenter.dart';
import 'package:hidden_lamp/screens/chat/view/chat.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

import '../../Notifications/view/Notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List colors = [
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          endDrawer: Drawer(
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red,
                          backgroundImage: AssetImage('assets/2-03.png'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MATUtils()
                                .customText('Mr. Lucifer', 18, Colors.black),
                            MATUtils().customText(
                                'Edit Your Profile', 18, Colors.black),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.365,
                      color: Colors.blue,
                      child: Column(children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Notifications()));
                          },
                          leading: const Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Notifications',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HelpCenter()));
                          },
                          leading: const Icon(
                            Icons.help_outline,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Help Center',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ChatWithUS()));
                          },
                          leading: const Icon(
                            Icons.support_agent,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Chat with us',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.security,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Privacy & Policies',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image(
                    height: MediaQuery.of(context).size.height / 3.5,
                    image: const AssetImage(
                      'assets/navv-01.png',
                    ),
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MATUtils().customText('Hello\nLucifer', 15, Colors.black),
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: const Icon(Icons.menu))
                    ],
                  ),
                ),
                MATUtils().customText('HL Reels', 18, Colors.black),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      10, // Set the height of the horizontal list
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor:
                                  const Color.fromARGB(255, 189, 189, 185),
                              child: CircleAvatar(
                                radius: 33,
                                backgroundColor:
                                    const Color.fromARGB(255, 248, 248, 247),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/s$index.png'),
                                ),
                              ),
                            ),
                            const Text(
                              'HL Reels',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: MATUtils()
                      .customText("Continue Courses", 18, Colors.black),
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 5.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: MediaQuery.of(context).size.width / 1.7,
                              decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(35)),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MATUtils().customText(
                                            "Electronics", 13, Colors.white),
                                        MATUtils().customText(
                                            "$index/10", 13, Colors.white)
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Image.asset(
                                      'assets/l${index + 3}.png',
                                      fit: BoxFit.fitWidth,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MATUtils().customText(
                                      "View Full Course", 13, Colors.white)
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 0),
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  height:
                                      MediaQuery.of(context).size.height / 14,
                                  padding: const EdgeInsets.all(0),
                                  child: ListView.builder(
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white54,
                                          child: index < 2
                                              ? Text('$index')
                                              : const Icon(
                                                  Icons.lock,
                                                  color: Colors.black26,
                                                ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: MATUtils()
                      .customText("Project of the week", 18, Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width / 1.7,
                        decoration: BoxDecoration(
                          color: colors[index + 2],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 43,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      'assets/${index + 2}-03.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Lucifer \n Deccan School",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Project Title",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 9,
                                    width:
                                        MediaQuery.of(context).size.width / 3.4,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(35)),
                                    ),
                                    child:
                                        Image.asset('assets/l${index + 1}.png'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: MATUtils()
                      .customText("Newly Added Projects", 18, Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width / 1.7,
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/l${index + 1}.png',
                              fit: BoxFit.fitWidth,
                              height: MediaQuery.of(context).size.height / 10,
                            ),
                            MATUtils().customText(
                                "Title of the Project", 13, Colors.white)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
