import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/assignments/controller/AssignmentController.dart';
import 'package:hidden_lamp/screens/assignments/model.dart/AssignmentModel.dart';
import 'package:provider/provider.dart';

import '../../../Provider/providers.dart';
import '../../../utils/MATUtils/MATUtils.dart';
import '../../../utils/SharedPreferances/sharedPreferaces.dart';
import '../../../utils/Webview/webview.dart';

class Assignments extends StatefulWidget {
  const Assignments({Key? key}) : super(key: key);

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  List colors = [
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
  ];
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
  }

  getData() async {
    LogicState userProvider = Provider.of(context, listen: false);
    var userData = await sharedPreferances().getUserDetails();
    await userProvider.fetchAssignmentsData(userData['phone']);
  }

  Random rnd = Random();
  @override
  Widget build(BuildContext context) {
    var assignmentsData = Provider.of<LogicState>(context).getAssignmentsData;
    var isAssignmentsLoading =
        Provider.of<LogicState>(context).isAssignmentsLoading;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: MATUtils()
                          .customText('Assignments', 22, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Chip(
                      backgroundColor: Colors.green,
                      avatar: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('P'),
                      ),
                      label: Text('Pending',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('C', style: TextStyle(color: Colors.black)),
                    ),
                    label: Text('Completed'),
                  ),
                  const Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('C', style: TextStyle(color: Colors.white)),
                    ),
                    label: Text('Not completed'),
                  )
                ],
              ),
              isAssignmentsLoading
                  ? const Center(child: Text("No Assignments"))
                  : ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: assignmentsData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          padding: const EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height / 6.5,
                          width: MediaQuery.of(context).size.width / 1.7,
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => WebViewPage(
                                          title: 'Assignment',
                                          Url: assignmentsData[index]
                                              ['AssignmentUrl'],
                                        )),
                              );
                            },
                            child: Stack(
                              children: [
                                Center(
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: Image.asset(
                                      'assets/l${index + 3}.png',
                                      fit: BoxFit.fitWidth,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MATUtils().customText(
                                            "Assignment ${index + 1}",
                                            15,
                                            Colors.white),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        MATUtils().customText(
                                            assignmentsData[index]
                                                ['assignmentName'],
                                            12,
                                            Colors.white),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: MATUtils().customText(
                                              assignmentsData[index]
                                                  ['discription'],
                                              11,
                                              Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        MATUtils().customText(
                                            "DeadLine: ${assignmentsData[index]['deadline']}",
                                            15,
                                            Colors.white),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MATUtils().customText(
                                            "Date: ${assignmentsData[index]['createdData']}",
                                            15,
                                            Colors.white),
                                        MATUtils().customText(
                                            "Time: ${assignmentsData[index]['time']}",
                                            15,
                                            Colors.white),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
