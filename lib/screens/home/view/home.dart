import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/Courses/view/ViewCourse.dart';
import 'package:hidden_lamp/screens/HelpCenter/view/HelpCenter.dart';
import 'package:hidden_lamp/screens/chat/view/chat.dart';
import 'package:hidden_lamp/screens/stories/view/story.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';
import 'package:hidden_lamp/utils/SharedPreferances/sharedPreferaces.dart';
import 'package:provider/provider.dart';

import '../../../Provider/providers.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
      setState(() {});
    });
    super.initState();
  }

  var userData = {};
  getData() async {
    LogicState userProvider = Provider.of(context, listen: false);
    userData = await sharedPreferances().getUserDetails();
    await userProvider.fetchData(userData['phone']);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var reelsData = Provider.of<LogicState>(context).getReelsData;
    var coursesData = Provider.of<LogicState>(context).getCoursesData;
    var projectOfTheWeekData =
        Provider.of<LogicState>(context).getprojectsOfTheWeekData;
    var projects = Provider.of<LogicState>(context).getprojectsData;
    var isLoading = Provider.of<LogicState>(context).isLoading;

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
                            MATUtils().customText('Mr. ${userData['userName']}',
                                18, Colors.black),
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
                        ListTile(
                          onTap: () async {
                            await sharedPreferances()
                                .clearSharePreferances(context);
                          },
                          leading: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Log Out',
                            style: const TextStyle(color: Colors.white),
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
                      MATUtils().customText(
                          'Hello\n${userData['userName']}', 15, Colors.black),
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
                isLoading
                    ? const Center(child: Text("No Stories"))
                    : SizedBox(
                        height: MediaQuery.of(context).size.height /
                            10, // Set the height of the horizontal list
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: reelsData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      // storyController().insertStory();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => Story(
                                                    stories: reelsData[index]
                                                        ['stories'],
                                                  )));
                                    },
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: const Color.fromARGB(
                                          255, 189, 189, 185),
                                      child: CircleAvatar(
                                        radius: 33,
                                        backgroundColor: const Color.fromARGB(
                                            255, 248, 248, 247),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              reelsData[index]['storyUrl']),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${reelsData[index]['title']}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
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
                isLoading
                    ? const Center(child: Text("No Course's"))
                    : Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: coursesData.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => ViewCourse(
                                                    courses: coursesData[index],
                                                  )));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: MediaQuery.of(context).size.width /
                                          1.7,
                                      decoration: BoxDecoration(
                                        color: colors[index],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(35)),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                MATUtils().customText(
                                                    coursesData[index]
                                                        ['CourseName'],
                                                    13,
                                                    Colors.white),
                                                MATUtils().customText(
                                                    "$index/10",
                                                    13,
                                                    Colors.white)
                                              ],
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.6,
                                            child: Image.network(
                                              coursesData[index]['ImageUrl'],
                                              fit: BoxFit.fitWidth,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            child: MATUtils().customText(
                                                "View Full Course",
                                                13,
                                                Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 0),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                14,
                                        padding: const EdgeInsets.all(0),
                                        child: ListView.builder(
                                          itemCount: coursesData[index]
                                                  ['EpisodeStatus']
                                              .length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder:
                                              ((context, internalIndex) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      Colors.white54,
                                                  child: coursesData[index]
                                                              ['EpisodeStatus']
                                                          [internalIndex]
                                                      ? Text('${internalIndex}')
                                                      : const Icon(
                                                          Icons.lock,
                                                          color: Colors.black26,
                                                        ),
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
                isLoading
                    ? const Center(child: Text("No Projects"))
                    : SizedBox(
                        height: MediaQuery.of(context).size.height / 5.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: projectOfTheWeekData.length,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 43,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                projectOfTheWeekData[index]
                                                    ['UserPhotoURL'])),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          child: Column(
                                            children: [
                                              Text(
                                                "${projectOfTheWeekData[index]['UserName']}",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${projectOfTheWeekData[index]['SchoolName']}",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          projectOfTheWeekData[index]
                                              ['ProjectTitle'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.4,
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              projectOfTheWeekData[index]
                                                  ['ProjectURL'],
                                              height: 500.0,
                                              width: 500.0,
                                            ),
                                          ),
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
                isLoading
                    ? const Center(child: Text("No Projects"))
                    : SizedBox(
                        height: MediaQuery.of(context).size.height / 5.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 20),
                              width: MediaQuery.of(context).size.width / 2,
                              child: Center(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          projects[index]['ImageUrl'],
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          child: MATUtils().customText(
                                              projects[index]['ProjectName'],
                                              13,
                                              Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
