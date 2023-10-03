import 'package:flutter/material.dart';

import '../../../utils/MATUtils/MATUtils.dart';

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
    Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                children: const [
                  Chip(
                    backgroundColor: Colors.green,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text('P'),
                    ),
                    label:
                        Text('Pending', style: TextStyle(color: Colors.white)),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('C', style: TextStyle(color: Colors.black)),
                    ),
                    label: Text('Completed'),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('C', style: TextStyle(color: Colors.white)),
                    ),
                    label: Text('Not completed'),
                  )
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
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
                      child: Stack(
                        children: [
                          Center(
                            child: Opacity(
                              opacity: 0.3,
                              child: Image.asset(
                                'assets/l${index + 3}.png',
                                fit: BoxFit.fitWidth,
                                height: MediaQuery.of(context).size.height / 10,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MATUtils().customText(
                                      "Assignment $index", 15, Colors.white),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MATUtils().customText(
                                      "Artificial Intelligence",
                                      12,
                                      Colors.white),
                                  MATUtils().customText(
                                      "Artificial Intelligence is powerful\nTechnology",
                                      11,
                                      Colors.white),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MATUtils().customText("DeadLine: $index Days",
                                      15, Colors.white),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MATUtils().customText(
                                      "Date: 10/2/2022", 15, Colors.white),
                                  MATUtils().customText(
                                      "Time: 11:33", 15, Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ],
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
